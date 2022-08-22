import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/base_data.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

import '../controllers/indicator_view_controller.dart';

class IndicatorViewView extends GetView<IndicatorViewController> {
  static launch({required VariableData data}) {
    Get.toNamed(Routes.INDICATOR_VIEW, arguments: {
      "data": data,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicator'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              text: controller.variableData.studyType?.toUpperCase(),
              style: Styles.tsWhiteRegular20,
            )),
            const SizedBox(
              height: 16.0,
            ),
            RichText(
                text: const TextSpan(
              text: "Set Parameters",
              style: Styles.tsWhiteRegular20,
            )),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: AppColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    text: controller.variableData.parameterName,
                    style: Styles.tsPrimaryColorRegular20,
                  )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: controller.textEditingController,
                    style: Styles.tsPrimaryColorRegular20,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      fillColor: AppColors.white,
                      filled: true,
                      hintText:
                          'Put a value between ${controller.variableData.minValue} and ${controller.variableData.maxValue}',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
