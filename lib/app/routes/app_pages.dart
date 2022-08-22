import 'package:get/get.dart';
import 'package:starter/app/modules/detail_page/bindings/detail_page_binding.dart';
import 'package:starter/app/modules/detail_page/views/detail_page_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/indicator_view/bindings/indicator_view_binding.dart';
import '../modules/indicator_view/views/indicator_view_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/variable_list/bindings/variable_list_binding.dart';
import '../modules/variable_list/views/variable_list_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PAGE,
      page: () => DetailPageView(),
      binding: DetailPageBinding(),
    ),
    GetPage(
      name: Routes.VARIABLE_LIST,
      page: () => const VariableListView(),
      binding: VariableListBinding(),
    ),
    GetPage(
      name: Routes.INDICATOR_VIEW,
      page: () => IndicatorViewView(),
      binding: IndicatorViewBinding(),
    ),
  ];
}
