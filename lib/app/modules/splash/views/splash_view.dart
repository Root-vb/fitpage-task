import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:starter/app/modules/splash/controllers/splash_controller.dart';

import '../../../../utils/helper/image_paths.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImagePaths.img_splash,
          height: 50.0,
          width: 50.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
