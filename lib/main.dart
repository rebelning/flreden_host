import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/app/modules/message/controllers/message_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'package:roujijisale/app/modules/home/controllers/home_controller.dart';
import 'package:roujijisale/app/modules/publish/controllers/publish_controller.dart';

import 'app/modules/root/controllers/app_controller.dart';

import 'app/modules/splash/controllers/splash_service.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/routes.dart';
import 'service/auth_service.dart';

void main() {
  runApp(EdenMaterialWrapper(
    // home: AppComponent(),
    initialRoute: Routes.app.root,
    unknownRoute: Routes.app.unknownRoute,
    getPages: Routes.getPages(),
    theme: EdenThemeData.lightThemeData(),
    initialBinding: BindingsBuilder(() {
      Get.putAsync(() => AuthService().init());
      Get.lazyPut(() => SplashService());
      Get.lazyPut(() => AppController());
      Get.lazyPut(() => HomeController());
      Get.lazyPut(() => PublishController());
      Get.lazyPut(() => MessageController());
      Get.lazyPut(() => AccountController());
    }),

    ///
    splashBuilder: (context, child) {
      // final botToastBuilder = BotToastInit();
      // child = botToastBuilder(context, child);
      return FutureBuilder<void>(
        key: const ValueKey('initFuture'),
        future: Get.find<SplashService>().init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return child ?? const SizedBox.shrink();
          }
          return SplashView();
        },
      );
    },
  ));
  EdenThemeData.systemUiOverlay();
}
