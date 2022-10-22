import 'package:flutter_eden/eden.dart';

class AuthService extends EdenBaseService {
  Future<AuthService> init() async {
    return this;
  }

  @override
  void onInit() {
    super.onInit();

    EdenHttpHook().setUnauthorized(() {
      // print("setUnauthorized-unauthorized");
      // clearLogin();
    });

    EdenHttpHook().setError((value) {
      // print("httpHook-error=$value");
      EdenSnackbar(value.toString(), title: "错误");
    });
  }
}
