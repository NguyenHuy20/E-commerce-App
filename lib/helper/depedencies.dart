import 'package:get/get.dart';
import 'package:shoppingproject/controller/popular_product_controller.dart';
import 'package:shoppingproject/data/api/api_client.dart';
import 'package:shoppingproject/data/repository/popular_product_repo.dart';
import 'package:shoppingproject/util/app_constant.dart';

import '../controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //API CLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  //REPOS
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //CONTROLLER
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
