import 'package:get/get.dart';
import 'package:invoice/features/home/bindings/home_bindings.dart';
import 'package:invoice/features/home/home_page.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.initial;
  static const dashboard = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
