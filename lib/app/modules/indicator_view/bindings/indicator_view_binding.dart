import 'package:get/get.dart';

import '../controllers/indicator_view_controller.dart';

class IndicatorViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndicatorViewController>(
      () => IndicatorViewController(),
    );
  }
}
