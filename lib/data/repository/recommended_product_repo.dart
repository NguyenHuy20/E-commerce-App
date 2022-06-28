import 'package:get/get.dart';
import 'package:shoppingproject/data/api/api_client.dart';
import 'package:shoppingproject/util/app_constant.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstant.RECOMMENED_PRODUCT_URI);
  }
}
