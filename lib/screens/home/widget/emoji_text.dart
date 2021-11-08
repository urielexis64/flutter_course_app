import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

class EmojiText extends StatelessWidget {
  const EmojiText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      child: RichText(
          text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
              text: "Let's boost your\nbrain power",
              style: TextStyle(
                  fontSize: 26, color: kFont, fontWeight: FontWeight.bold)),
          TextSpan(text: '✨', style: TextStyle(fontSize: 26)),
        ],
      )),
    );
  }
}
