import 'package:flreden_user/app/routes/flroutes.dart';
import 'package:flutter_eden/eden.dart';

import 'modules/app_route.dart';

///routes
abstract class Routes {
  ///
  static final app = AppRoute();

  // static final message = AccountRoute()
  static List<GetPage> getPages() {
    return [
      ...app.getRoutePages(),
      ...FLRoutes.getPages(),
    ];
  }
}
