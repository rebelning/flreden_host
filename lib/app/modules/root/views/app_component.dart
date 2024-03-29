import 'package:flreden_user/app/modules/account/me/views/account_index.dart';

import 'package:flreden_user/app/modules/message/views/message_index.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flreden_host/app/modules/root/home/views/home_index.dart';
import 'package:flreden_host/app/modules/root/publish/views/publish_index.dart';

import '/app/modules/root/controllers/app_controller.dart';

class AppComponent extends EdenNavBaseWidget<AppController> {
  @override
  String toolbarTitle() {
    return "App";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  @override
  List<BottomNavigationBarItem> renderBarItems() {
    return [
      const BottomNavigationBarItem(
        label: "首页",
        icon: Icon(
          Icons.home,
        ),
      ),
      const BottomNavigationBarItem(
        label: "发布",
        icon: Icon(
          Icons.publish,
        ),
      ),
      const BottomNavigationBarItem(
        label: "消息",
        icon: Icon(
          Icons.message,
        ),
      ),
      const BottomNavigationBarItem(
        label: "我的",
        icon: Icon(
          Icons.account_circle,
        ),
      ),
    ];
  }

  @override
  List<Widget> renderPages() {
    return [
      EdenKeepAliveWrapper(child: HomeIndex()),
      EdenKeepAliveWrapper(child: PublishIndex()),
      EdenKeepAliveWrapper(child: MessageIndex()),
      EdenKeepAliveWrapper(child: AccountIndex()),
    ];
  }
}
