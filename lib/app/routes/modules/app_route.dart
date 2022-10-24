import 'package:flrousale/app/modules/account/me/controllers/account_controller.dart';
import 'package:flrousale/app/modules/account/me/views/account_index.dart';
import 'package:flrousale/app/modules/message/controllers/message_controller.dart';
import 'package:flrousale/app/modules/message/views/message_index.dart';
import 'package:flrousale/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/app.dart';
import 'package:roujijisale/app/modules/error/controllers/error_controller.dart';
import 'package:roujijisale/app/modules/error/view/error_page.dart';
import 'package:roujijisale/app/modules/root/bindings/app_bindings.dart';

import 'package:roujijisale/app/modules/root/controllers/app_controller.dart';
import 'package:roujijisale/app/modules/root/home/controllers/home_controller.dart';
import 'package:roujijisale/app/modules/root/home/views/home_index.dart';
import 'package:roujijisale/app/modules/root/publish/controllers/publish_controller.dart';
import 'package:roujijisale/app/modules/root/publish/views/publish_index.dart';
import 'package:roujijisale/app/modules/root/views/app_component.dart';

class AppRoute extends EdenBaseRoute {
  @override
  String get prefix => "/app";

  String get root => "/";

  String get home => prefix + "/home";
  String get publish => prefix + "/publish";
  String get message => prefix + "/message";
  String get account => prefix + "/account";

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
        middlewares: [RouteAuthMiddleware(priority: 0)],
        bindings: [
          AppBindings(),
        ],
        bindingsBuilder: () {
          // Get.lazyPut(() => AppController());
        },
        children: [
          routePage(
            name: home,
            page: () => HomeIndex(),
            bindingsBuilder: () {
              // Get.lazyPut(() => HomeController());
            },
          ),
          routePage(
            name: publish,
            page: () => PublishIndex(),
            bindingsBuilder: () {
              // Get.lazyPut(() => PublishController());
            },
          ),
          routePage(
            name: message,
            page: () => MessageIndex(),
            bindingsBuilder: () {
              // Get.lazyPut(() => MessageController());
            },
          ),
          routePage(
            name: account,
            page: () => AccountIndex(),
            bindingsBuilder: () {
              // Get.lazyPut(() => AccountController());
            },
          ),
        ],
      ),
      routePage(
        name: error404,
        page: () => ErrorPage(),
        bindingsBuilder: () {
          Get.lazyPut(() => ErrorController());
        },
      ),
    ];
  }
}

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    AuthService authService = Get.find<AuthService>();
    if (authService.isLogin == true) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 1),
          () => EdenSnackbar("请先登录APP", title: "提示"));
      return RouteSettings(name: FLRoutes.auth.login);
    }
  }
}
