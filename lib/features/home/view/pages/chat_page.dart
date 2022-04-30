import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:yolotl/features/home/view/controllers/chat_controller.dart';
import 'package:yolotl/features/home/view/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YolotlColors.orange,
        toolbarHeight: 75,
        leading: IconButton(
          color: Colors.white,
          iconSize: kIconSize / 1.5,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Yolotl',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: Get.textTheme.headline4!.copyWith(color: YolotlColors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _messages[i],
            reverse: true,
          )),
          Container(
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _inputYolotl(),
          )
        ],
      ),
    );
  }

  Widget _inputYolotl() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                height: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(kBorderRadius)),
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText2,
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (texto) {
                    setState(() {
                      if (texto.trim().length > 0) {
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false;
                      }
                    });
                  },
                  decoration:
                      InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                  focusNode: _focusNode,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text('Enviar'),
                    onPressed: _estaEscribiendo
                        ? () => _handleSubmit(_textController.text.trim())
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: YolotlColors.orange,
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String texto) async {
    final ChatController chatController = Get.find<ChatController>();

    final userController = Get.find<UserController>();
    if (texto.length == 0) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: userController.user.uid,
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    final String textoBot =
        await chatController.remoteGetCompletion(text: texto);

    ChatMessage botMessage = new ChatMessage(
      texto: textoBot,
      uid: 'panabot',
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
    );

    setState(() {
      _messages.insert(0, botMessage);
    });

    botMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
