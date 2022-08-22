import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/base_data.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

import '../controllers/variable_list_controller.dart';

class VariableListView extends GetView<VariableListController> {
  static launch({required VariableData data}) {
    Get.toNamed(Routes.VARIABLE_LIST, arguments: {
      "data": data,
    });
  }

  const VariableListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variables'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: AppColors.primaryColor,
        child: ListView.separated(
          itemCount: controller.variableData.values?.length ?? 0,
          itemBuilder: (context, index) => RichText(
              text: TextSpan(
            text: controller.variableData.values![index],
            style: Styles.tsWhiteRegular20,
          )),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.white,
              height: 20,
            );
          },
        ),
      ),
    );
  }
}
