
import 'package:yolotl/config/common.dart';
import 'package:yolotl/core/widgets/widgets.dart';
import 'package:yolotl/features/auth/view/controllers/register_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

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
  final RegisterController controller;
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
        'Registrarse',
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
      _RegisterForm(controller: controller),
      Spacer(
        flex: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: OrangeButton(
          text: 'Registrarse',
          onPressed: () {
            controller.validateRegister();
          },
        ),
      ),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('ya tienes una cuenta? Inicia Sesión'),
      ),
      Spacer(
        flex: 1,
      ),
    ]);
  }
}

class _RegisterForm extends StatelessWidget {
  final RegisterController controller;
  const _RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Form(
        key: controller.formKeyRegister,
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
              placeholder: 'Nombre',
              textController: controller.nameCtrl,
              validationError: 'Introduce un nombreválido',
              keyboardType: TextInputType.text,
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
