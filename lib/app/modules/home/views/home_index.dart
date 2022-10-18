import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/app.dart';
import '/app/modules/home/controllers/home_controller.dart';

///
class HomeIndex extends EdenBaseListWidget<HomeController> {
  @override
  String toolbarTitle() {
    return "home";
  }

  @override
  Widget buildListView(
      BuildContext context, EdenBaseListController _controller) {
    return Container(
      child: Center(
        child: ButtonWidget(
          label: "login",
          onPressed: () {
            RouteCore.push(FLRoutes.account.login);
          },
        ),
      ),
    );
  }
}
