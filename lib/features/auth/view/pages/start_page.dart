import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/widgets/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
        child: Container(),
        //Container(
        //    decoration: BoxDecoration(
        //  image: DecorationImage(
        //      image: Image.asset('assets/illustration1.png').image),
        //)),
      ),
      Text(
        'Yolotl',
        style: Get.textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: 10),
        child: Text(
          "",
          style: Get.textTheme.bodyText2,
        ),
      ),
      const Spacer(
        flex: 1,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: OrangeButton(
          text: 'Comenzar',
          onPressed: () {
            Get.toNamed(Routes.LOGIN);
          },
        ),
      ),
      const Spacer(
        flex: 1,
      ),
    ]);
  }
}
