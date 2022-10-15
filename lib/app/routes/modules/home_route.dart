import 'package:flutter_eden/eden.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/views/home_index.dart';

class HomeRoute extends EdenBaseRoute {
  @override
  String get prefix => "/home";
  String get home => prefix;
  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: home,
        page: () => HomeIndex(),
        bindingsBuilder: () {
          Get.lazyPut(() => HomeController());
        },
      ),
    ];
  }
}
