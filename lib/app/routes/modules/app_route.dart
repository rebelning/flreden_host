import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/modules/error/controllers/error_controller.dart';
import 'package:roujijisale/app/modules/error/view/error_page.dart';

class AppRoute extends EdenBaseRoute {
  @override
  String get prefix => "/app";

  String get root => "/";

  /// 找不到页面
  String get error404 => prefix + "/error/unknown404";

  GetPage get unknownRoute => routePage(
      name: error404,
      page: () => ErrorPage(),
      bindingsBuilder: () {
        Get.lazyPut(() => ErrorController());
      });
  @override
  List<GetPage> getRoutePages() {
    return [];
  }
}
