import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //? Features

  //! Usecases
  //* Users

  //! Repository
  //* Users

  //! Datasources
  //* Users

  //! External
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
