import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startOnboarding();
  }

  _startOnboarding() async {
    _launchPage();
  }

  _launchPage() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.offAllNamed(Routes.HOME);
    });
  }
}
