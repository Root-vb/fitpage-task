import 'dart:io';

import 'package:get/get.dart';
import 'package:starter/app/data/values/env.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

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

_launchStore() async {
  if (Platform.isAndroid) {
    if (!await launch(Env.playStoreLink)) {
      throw 'Could not launch ${Env.playStoreLink}';
    }
  } else if (Platform.isIOS) {
    if (!await launch(Env.appStoreLink)) {
      throw 'Could not launch ${Env.appStoreLink}';
    }
  }
}
