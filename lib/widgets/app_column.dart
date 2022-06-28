import 'package:flutter/material.dart';
import 'package:shoppingproject/pages/home/iconAndText.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/big_text.dart';
import 'package:shoppingproject/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: "Chinese Side"),
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
    ]);
  }
}
