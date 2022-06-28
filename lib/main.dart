import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingproject/controller/popular_product_controller.dart';
import 'package:shoppingproject/pages/food/food_popular_detail.dart';
import 'package:shoppingproject/pages/food/recommend_food_detail.dart';
import 'package:shoppingproject/pages/home/food_page_body.dart';
import 'package:shoppingproject/pages/home/main_food_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingproject/pages/food/food_popular_detail.dart';
import 'controller/recommended_product_controller.dart';
import 'helper/depedencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: MainFoodPage(),
        );
      },
    );
  }
}
