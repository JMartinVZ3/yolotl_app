import 'package:yolotl/config/common.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/widgets/widgets.dart';
import 'package:yolotl/features/auth/view/controllers/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YolotlColors.white,
      body: _Body(
        controller: controller,
      ),
    );
  }
}

/// Widget que contiene el cuerpo de la pagina
class _Body extends StatelessWidget {
  final LoginController controller;
  const _Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(
        flex: 1,
      ),
      Text(
        'Iniciar Sesión',
        style: Get.textTheme.headline1,
      ),
      Expanded(
        flex: 4,
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/illustration1.png').image),
        )),
      ),
      Spacer(
        flex: 1,
      ),
      _LoginForm(controller: controller),
      Spacer(
        flex: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: OrangeButton(
          text: 'Iniciar Sesión',
          onPressed: () {
            controller.validateLogin();
          },
        ),
      ),
      TextButton(
        onPressed: () {
          Get.toNamed(Routes.REGISTER);
        },
        child: Text('No tienes una cuenta? Regístrate'),
      ),
      Spacer(
        flex: 1,
      ),
    ]);
  }
}

class _LoginForm extends StatelessWidget {
  final LoginController controller;
  const _LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomInput(
              placeholder: 'Email',
              textController: controller.emailCtrl,
              validationError: 'Introduce un correo válido',
              isEmail: true,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            CustomInput(
              placeholder: 'Contraseña',
              textController: controller.passwordCtrl,
              validationError: 'Introduce una contraseña válida',
              isPassword: true,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
