import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/detailPage/views/detail_page_view.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';
import 'package:starter/app/modules/home/views/main_list_item.dart';
import 'package:starter/app/theme/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.homePageData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => DetailPageView()
                        .launch(controller.homePageData.elementAt(index)!),
                    child: MainListItem(
                      heading:
                          controller.homePageData.elementAt(index)?.name ?? "",
                      subheading:
                          controller.homePageData.elementAt(index)?.tag ?? "",
                      color:
                          controller.homePageData.elementAt(index)?.color ?? "",
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
