import 'package:flutter_eden/eden.dart';

class AuthService extends EdenBaseService {
  Future<AuthService> init() async {
    return this;
  }

  @override
  void onInit() {
    super.onInit();

    print("auth service init...");
    HttpHook().setUnauthorized(() {
      // print("setUnauthorized-unauthorized");
      // clearLogin();
    });

    HttpHook().setError((value) {
      // print("httpHook-error=$value");
      Get.snackbar("提示", "$value");
    });
  }
}
