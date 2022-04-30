import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BotRepository {
  Future<Either<Failure, String>> getCompletion({
    required String text,
  });
}
