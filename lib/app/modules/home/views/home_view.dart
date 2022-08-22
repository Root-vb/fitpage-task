import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';
import 'package:starter/app/modules/home/views/main_list_item.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/buttons/primary_filled_button.dart';

import '../../detail_page/views/detail_page_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: Obx(
        () => (controller.isLoading.value)
            ? loadingView()
            : (controller.gotError.value)
                ? errorView()
                : dataView(),
      ),
    );
  }

  Widget loadingView() {
    return Container(
      color: AppColors.primaryColor,
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.white),
      ),
    );
  }

  Widget errorView() {
    return Center(
      child: PrimaryFilledButton(
        text: "Retry",
        onTap: () => controller.getDashboardData(),
      ),
    );
  }

  Widget dataView() {
    return Container(
      color: AppColors.primaryColor,
      child: Center(
        child: Obx(
          () => ListView.separated(
            itemCount: controller.homePageData.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => DetailPageView()
                    .launch(controller.homePageData.elementAt(index)!),
                child: MainListItem(
                  heading: controller.homePageData.elementAt(index)?.name ?? "",
                  subheading:
                      controller.homePageData.elementAt(index)?.tag ?? "",
                  color: controller.homePageData.elementAt(index)?.color ?? "",
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.white,
                height: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}
