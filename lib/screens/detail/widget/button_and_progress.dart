import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonAndProgress extends StatelessWidget {
  const ButtonAndProgress({Key? key, required this.disabled}) : super(key: key);

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Icon(
            disabled ? Icons.lock : Icons.play_arrow_rounded,
            color: disabled ? kDarkGrey : Colors.white,
          ),
          backgroundColor: disabled ? kDarkGrey.withOpacity(0.1) : kAccent,
        ),
        ...List.generate(
            23,
            (index) => Container(
                  height: 6,
                  width: 2,
                  color: index % 2 != 0
                      ? disabled
                          ? kDarkGrey.withOpacity(0.3)
                          : kAccent
                      : Colors.transparent,
                ))
      ],
    );
  }
}
