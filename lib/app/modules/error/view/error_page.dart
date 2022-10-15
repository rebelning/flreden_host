import 'package:flutter_eden/eden.dart';
import 'package:roujijisale/app/modules/error/controllers/error_controller.dart';

class ErrorPage extends EdenBaseWidget<ErrorController> {
  @override
  Widget buildBody(BuildContext context, ErrorController _controller) {
    return Container();
  }

  @override
  String toolbarTitle() {
    return "404";
  }
}
