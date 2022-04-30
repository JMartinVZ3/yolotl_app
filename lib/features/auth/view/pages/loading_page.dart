import 'package:yolotl/config/common.dart';
import 'package:yolotl/features/auth/view/controllers/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final LoadingController loadingController = controller;
    return Scaffold(
      backgroundColor: YolotlColors.purple,
      body: Center(
        child: CircularProgressIndicator(
          color: YolotlColors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
