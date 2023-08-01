import 'package:flutter_eden/eden.dart';
import 'package:flreden_host/app/modules/root/home/controllers/home_controller.dart';

///
class HomeIndex extends EdenBaseListWidget<HomeController> {
  @override
  String toolbarTitle() {
    return "home";
  }

  @override
  Widget buildListView(
      BuildContext context, EdenBaseListController _controller) {
    return Container();
  }
}
