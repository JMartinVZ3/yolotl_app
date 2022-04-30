import 'package:yolotl/features/home/view/bindings/menu_binding.dart';
import 'package:yolotl/features/home/view/pages/menu_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    ///==============AUTH===========///

    ///==============HOME===========///
    GetPage<dynamic>(
        name: Routes.MENU,
        page: () => const MenuPage(),
        transition: Transition.native,
        bindings: [
          MenuBinding(),
        ]),

  ];
}
