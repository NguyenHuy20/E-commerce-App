import 'package:flutter/cupertino.dart';
import 'package:shoppingproject/widgets/small_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;

  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.sp,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          icon,
          color: iconcolor,
        ),
        SmallText(
          text: text,
        ),
        SizedBox(width: 5.sp),
      ],
    );
  }
}
