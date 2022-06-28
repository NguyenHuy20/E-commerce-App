import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingproject/pages/home/iconAndText.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/app_column.dart';
import 'package:shoppingproject/widgets/app_icon.dart';
import 'package:shoppingproject/widgets/big_text.dart';
import 'package:shoppingproject/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350.sp,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food2.jpg"))),
              )),
          Positioned(
              top: 45.sp,
              left: 20.sp,
              right: 20.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 350.sp - 25,
              child: Container(
                padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(),
                    SizedBox(
                      height: 10.sp,
                    ),
                    BigText(text: 'Introduce'),
                    SizedBox(
                      height: 10.sp,
                    ),
                    const Expanded(
                        child: SingleChildScrollView(
                      child: Text(
                          'Commonly well-known along with Pho, Vietnamese baguette sandwiches, called Banh Mi, have attracted a growing fan base around the world. The uniqueness of Banh mi not only lies within the light and crispy baguette, but also the variation of flavors Vietnam fillings bring out the most amazing flavor. Banh mi is a unique French-Vietnamese sandwich that’s great for when you’re in need of a quick meal. Priced between VND 10,000 and VND 15,000, it consists of a toasted baguette sandwich, pickled vegetables, pate, butter, soy sauce, cilantro, chillies, etc. Most banh mi sellers also offer a wide range of meat fillings, including heo quay (roasted pork belly), trung op la (fried egg), thit nuong (grilled pork loin), cha ca (fried fish with turmeric and dill), cha lua (boiled sausages), xa xiu (Chinese barbecued pork), and thit ga (poached chicken). With it reputation, Banh mi is considered to be the essence of Vietnamese cuisine. It is a must-try that even the pickiest eaters can’t resist.'),
                    ))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 120.sp,
        padding: EdgeInsets.only(
            top: 30.sp, bottom: 30.sp, left: 20.sp, right: 20.sp),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 20.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 20.sp, bottom: 20.sp, left: 10.sp, right: 10.sp),
              child: BigText(
                text: '\$10 Add to cart',
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
