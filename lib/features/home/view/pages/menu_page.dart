import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/colors.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/services/auth_service.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: YolotlColors.lightYellow,
        image: DecorationImage(
          image: Image.asset("images/fondoAjolote.png").image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: YolotlColors.red,
                  borderRadius: BorderRadius.circular(100),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      AuthService.deleteToken();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: Image.asset("images/insulina.png").image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: YolotlColors.red,
                  borderRadius: BorderRadius.circular(100),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: Image.asset("images/play.png").image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: const Color.fromARGB(255, 165, 51, 41),
                  borderRadius: BorderRadius.circular(100),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CHAT);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: Image.asset("images/chat.png").image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () async {
                await AuthService.deleteToken();
                Get.back();
                Get.back();
                Get.toNamed(Routes.START);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 40,
                  right: 20,
                ),
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("images/salir.png").image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
