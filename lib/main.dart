import 'package:flrousale/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

import 'app/modules/splash/controllers/splash_service.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(EdenMaterialWrapper(
    unknownRoute: Routes.app.unknownRoute,
    getPages: Routes.getPages(),
    // home: AppComponent(),
    initialRoute: Routes.app.root,
    theme: EdenThemeData.lightThemeData(),
    initialBinding: BindingsBuilder(() {
      Get.putAsync(() => AuthService().init());
      Get.lazyPut(() => SplashService());
      // Get.lazyPut(() => AppController());
      // Get.lazyPut(() => HomeController());
      // Get.lazyPut(() => PublishController());
      // Get.lazyPut(() => MessageController());
      // Get.lazyPut(() => AccountController());
    }),

    ///
    splashBuilder: (context, child) {
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
