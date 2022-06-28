import 'package:flutter/material.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/app_icon.dart';
import 'package:shoppingproject/widgets/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                child: Center(
                  child: BigText(text: 'Chinese Side'),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                    'Commonly well-known along with Pho, Vietnamese baguette sandwiches, called Banh Mi, have attracted a growing fan base around the world. The uniqueness of Banh mi not only lies within the light and crispy baguette, but also the variation of flavors Vietnam fillings bring out the most amazing flavor. Banh mi is a unique French-Vietnamese sandwich that’s great for when you’re in need of a quick meal. Priced between VND 10,000 and VND 15,000, it consists of a toasted baguette sandwich, pickled vegetables, pate, butter, soy sauce, cilantro, chillies, etc. Most banh mi sellers also offer a wide range of meat fillings, including heo quay (roasted pork belly), trung op la (fried egg), thit nuong (grilled pork loin), cha ca (fried fish with turmeric and dill), cha lua (boiled sausages), xa xiu (Chinese barbecued pork), and thit ga (poached chicken). With it reputation, Banh mi is considered to be the essence of Vietnamese cuisine. It is a must-try that even the pickiest eaters can’t resist.Fried chicken is almost impossible to become familiar with in a busy life. It is often the main dish at fast food restaurants and is also something that not only adults but also children love. The chicken pieces will be coated with a layer of flour, then fried. When you eat, you will see the crispness of the fried dough and the tenderness of the chicken. The delicious taste with a little French fries or salad will give you a great meal. I really love this dish.The ingredients for baking are very simple, including: flour, coconut milk, turmeric powder, salt and onions, mixed with water. Next, the cake dough will be poured into the frying pan with cooking oil applied and created a thin layer of cake. After about three minutes, we will sprinkle shrimp, pork and bean sprouts on half of the cake surface and fold. Next, we will fry for another twenty seconds. Banh Xeo will usually be served with a dipping sauce. The cake will be cut into three to four pieces, then rolled with rice balls and lettuce. Finally, we add in the prepared dipping sauce, creating a perfect combination of flavors. Just take a bite, you will feel its crunchiness, a little sweetness, fat mixed with the cool taste of vegetables and herbs.There are many elements to create a delicious bowl of Pho: broth, pho cake, meat, seasoning ingredients, … First, to have a delicious pot of broth, we must have many other spice ingredients. together such as cinnamon, anise, bones, … The bones must be cooked for a long time to make the broth delicious and sweet. Next, we will add other spice ingredients to increase the flavor of the broth. Pho is made from rice flour, white and soft.There are many elements to create a delicious bowl of Pho: broth, pho cake, meat, seasoning ingredients, … First, to have a delicious pot of broth, we must have many other spice ingredients. together such as cinnamon, anise, bones, … The bones must be cooked for a long time to make the broth delicious and sweet. Next, we will add other spice ingredients to increase the flavor of the broth. Pho is made from rice flour, white and soft.'),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 20 * 2.5, right: 20 * 2.5, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$12.88" + "X" + "0",
                  color: AppColors.mainBlackColor,
                  size: 26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.sp, bottom: 5.sp),
                padding: EdgeInsets.only(
                    top: 20.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                  size: 26.sp,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.sp, bottom: 5.sp),
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
          )
        ],
      ),
    );
  }
}
