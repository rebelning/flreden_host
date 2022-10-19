import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/app.dart';
import 'package:roujijisale/app/modules/error/controllers/error_controller.dart';
import 'package:roujijisale/app/modules/error/view/error_page.dart';
import 'package:roujijisale/app/modules/root/controllers/app_controller.dart';
import 'package:roujijisale/app/modules/root/views/app_component.dart';

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
    return [
      routePage(
          name: root,
          page: () => AppComponent(),
          // middlewares: [RouteAuthMiddleware(priority: 0)],
          bindingsBuilder: () {
            Get.lazyPut(() => AppController());
          })
    ];
  }
}

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    Future.delayed(Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
    return RouteSettings(name: FLRoutes.account.login);
  }
}
