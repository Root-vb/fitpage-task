import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/base_data.dart';
import 'package:starter/app/modules/detail_page/views/custom_text_widget.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  launch(HomeData homeData) {
    Get.toNamed(Routes.DETAIL_PAGE, arguments: {
      "homeData": homeData,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(controller.pageData.name ?? ""),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: [
            headerWidget(),
            CustomText(data: controller.pageData),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(
            text: controller.pageData.name,
            style: Styles.tsWhiteRegular20,
          )),
          const SizedBox(
            height: 4.0,
          ),
          RichText(
            text: TextSpan(
                text: controller.pageData.tag,
                style: TextStyle(
                  color: getColor(),
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0,
                )),
          ),
        ],
      ),
    );
  }

  Color getColor() {
    if (controller.pageData.color == "red") {
      return AppColors.red;
    } else if (controller.pageData.color == "green") {
      return AppColors.green;
    }
    return AppColors.white;
  }
}
