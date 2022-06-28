import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingproject/controller/popular_product_controller.dart';
import 'package:shoppingproject/controller/recommended_product_controller.dart';
import 'package:shoppingproject/data/repository/popular_product_repo.dart';
import 'package:shoppingproject/models/product_model.dart';
import 'package:shoppingproject/pages/food/recommend_food_detail.dart';
import 'package:shoppingproject/pages/home/iconAndText.dart';
import 'package:shoppingproject/util/app_constant.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/big_text.dart';
import 'package:shoppingproject/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final List<Map<String, dynamic>> _data = [
    {
      "icon": Icons.circle_sharp,
      "text": "Normal",
      "color": AppColors.iconColor1,
    },
    {
      "icon": Icons.location_on,
      "text": "1.7km",
      "color": AppColors.mainColor,
    },
    {
      "icon": Icons.access_time_rounded,
      "text": "32min",
      "color": AppColors.iconColor2,
    },
  ];
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: 320.sp,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: 20.sp,
        ),
        Container(
          margin: EdgeInsets.only(left: 30.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3.sp),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3.sp),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        Container(
            //height: 850.sp,
            child: GetBuilder<RecommendedProductController>(
          builder: (recommendProduct) {
            return recommendProduct.isLoaded
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recommendProduct.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 20.sp, right: 20.sp, bottom: 20.sp),
                        child: Row(
                          children: [
                            Container(
                              width: 120.sp,
                              height: 120.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstant.BASE_URL +
                                          "/uploads/" +
                                          recommendProduct
                                              .recommendedProductList[index]
                                              .img!))),
                            ),
                            Expanded(
                                child: Container(
                              height: 95.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.sp),
                                      bottomRight: Radius.circular(20.sp)),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.sp),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text:
                                              "Hambergur full meat with chese"),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      SmallText(text: "from Mc Donald"),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Row(
                                        children: _data.map<Widget>((e) {
                                          return IconAndText(
                                              icon: e['icon'],
                                              text: e['text'],
                                              iconcolor: e['color']);
                                        }).toList(),
                                      )
                                    ]),
                              ),
                            ))
                          ],
                        ),
                      );
                    })
                : CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        )),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTran = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220.sp,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF69c5df),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstant.BASE_URL +
                        "/uploads/" +
                        popularProduct.img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.sp,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: popularProduct.name!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1002"),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _data.map<Widget>((e) {
                          return IconAndText(
                            icon: e['icon'],
                            text: e['text'],
                            iconcolor: e['color'],
                          );
                        }).toList(),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
