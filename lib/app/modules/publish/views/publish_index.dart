import 'package:flutter_eden/eden.dart';
import '/app/modules/publish/controllers/publish_controller.dart';

///publish
class PublishIndex extends EdenBaseWidget<PublishController> {
  @override
  String toolbarTitle() {
    return "发布商品";
  }

  @override
  Widget buildBody(BuildContext context, EdenBaseController _controller) {
    return Container();
  }
}
