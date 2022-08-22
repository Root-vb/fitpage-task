import 'package:get/get.dart';

import '../controllers/variable_list_controller.dart';

class VariableListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VariableListController>(
      () => VariableListController(),
    );
  }
}
