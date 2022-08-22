import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/dto/base_data.dart';

class IndicatorViewController extends GetxController {
  VariableData variableData = Get.arguments['data'];
  var textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textEditingController.text = variableData.defaultValue.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
