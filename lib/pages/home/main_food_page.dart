import 'package:flutter/material.dart';
import 'package:shoppingproject/pages/home/food_page_body.dart';
import 'package:shoppingproject/pages/home/food_page_body.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/big_text.dart';
import 'package:shoppingproject/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45.sp, bottom: 15.sp),
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'VietNam',
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'Ho Chi Minh city',
                              color: Colors.black45,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                          width: 45,
                          height: 45,
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor,
                          )),
                    )
                  ]),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
