import 'package:get/get.dart';
import 'package:starter/app/data/repository/home_repository.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/base/base_controller.dart';
import 'package:starter/utils/loading/loading_utils.dart';

import '../../../data/models/dto/base_data.dart';

class HomeController extends BaseController<HomeRepository> {
  var homePageData = <HomeData?>[].obs;
  var gotError = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }

  @override
  void onClose() {}

  void getDashboardData() {
    gotError.value = false;
    isLoading.value = true;
    repository.getData().then((response) {
      isLoading.value = false;
      if (response.data != null) {
        response.data?.data?.forEach((element) {
          homePageData.add(element);
        });
      } else {
        gotError.value = true;
        Get.snackbar(
            ErrorMessages.networkGeneral, response.error?.message ?? "");
      }
    }, onError: (error) {
      LoadingUtils.hideLoader();
      isLoading.value = false;
      gotError.value = true;
      Get.snackbar(ErrorMessages.networkGeneral, error);
    });
  }
}
