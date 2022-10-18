import 'package:flrousale/app/routes/flroutes.dart';
import 'package:flutter_eden/eden.dart';

import 'modules/app_route.dart';
import 'modules/home_route.dart';
import 'modules/publish_route.dart';

///routes
abstract class Routes {
  ///
  static final app = AppRoute();
  static final home = HomeRoute();
  static final publish = PublishRoute();
  // static final message = AccountRoute()
  static List<GetPage> getPages() {
    return [
      ...app.getRoutePages(),
      ...home.getRoutePages(),
      ...publish.getRoutePages(),
      ...FLRoutes.getPages(),
    ];
  }
}
