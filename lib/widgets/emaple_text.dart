import 'package:flutter/material.dart';
import 'package:shoppingproject/util/colors.dart';
import 'package:shoppingproject/widgets/small_text.dart';

class ExampleText extends StatefulWidget {
  final String text;
  const ExampleText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExampleText> createState() => _ExampleTextState();
}

class _ExampleTextState extends State<ExampleText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 50;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                    text: hiddenText
                        ? (firstHalf + "...")
                        : firstHalf + secondHalf),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
