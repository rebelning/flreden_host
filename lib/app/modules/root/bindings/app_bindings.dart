import 'package:flrousale/app/modules/account/me/controllers/account_controller.dart';
import 'package:flrousale/app/modules/message/controllers/message_controller.dart';
import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/modules/root/controllers/app_controller.dart';
import 'package:roujijisale/app/modules/root/home/controllers/home_controller.dart';
import 'package:roujijisale/app/modules/root/publish/controllers/publish_controller.dart';

///
class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PublishController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => AccountController());
  }
}
