import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //implementacija splasha

  late SplashController splashController;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3));
    super.onInit();
  }
}
