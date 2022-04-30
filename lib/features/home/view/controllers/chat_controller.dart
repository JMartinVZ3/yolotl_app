import 'dart:developer';

import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/helpers/helpers.dart';
import 'package:yolotl/di/injection_container.dart';
import 'package:yolotl/features/home/domain/usecases/get_completion.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  //! Usecases
  /// Funcion que trae la respuesta del bot
  final GetCompletion getCompletion = sl<GetCompletion>();

  //! Usecases Implementations
  /// Funcion que implementa la verificacion del usuario
  Future<String> remoteGetCompletion({
    required String text,
  }) async {
    showLoading();
    final Either<Failure, String> result =
        await getCompletion.call(GetCompletionParams(text: text));

    return _handleGetCompletion(result);
  }

  //! Handlers
  /// Funcion que verifica el resultado de la verificacion del usuario
  String _handleGetCompletion(Either<Failure, String> result) {
    return result.fold(
      (failure) {
        print(failure);
        Get.back();

        return 'error :(';
      },
      (data) {
        Get.back();
        log(data.toString());
        return data;
      },
    );
  }
}
