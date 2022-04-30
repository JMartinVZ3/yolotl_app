import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/widgets/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YolotlColors.white,
      body: _Body(),
    );
  }
}

/// Widget que contiene el cuerpo de la pagina
class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 5,
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/illustration1.png').image),
        )),
      ),
      Text(
        'Panabot',
        style: Get.textTheme.headline1,
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
        child: Text(
          "Panabot es una inteligencia artificial que te puede ayudar a hacer las tareas, e incluso responderte preguntas sobre filosofía.",
          style: Get.textTheme.bodyText2,
        ),
      ),
      Spacer(
        flex: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: PurpleButton(
          text: 'Comenzar',
          onPressed: () {
            Get.toNamed(Routes.LOGIN);
          },
        ),
      ),
      Spacer(
        flex: 1,
      ),
    ]);
  }
}
