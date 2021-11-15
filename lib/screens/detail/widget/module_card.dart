import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'button_and_progress.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.lessons,
    this.disabled = false,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int duration;
  final int lessons;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final hours = duration ~/ 60;
    final minutes = duration % 60;
    final formattedDuration = '${hours == 0 ? '' : '$hours h '}$minutes min';

    return Row(
      children: [
        ButtonAndProgress(disabled: disabled),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: disabled ? Colors.transparent : kCardBackground,
              border: Border.all(
                color: disabled ? kDarkGrey.withOpacity(0.2) : kCardBackground,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: kDarkGrey.withOpacity(.7), fontSize: 12),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: kDarkGrey.withOpacity(.7),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Chip(
                      backgroundColor: disabled ? kDisabled : kDarkGreen,
                      label: Row(
                        children: [
                          Icon(Icons.schedule_rounded,
                              color: kDarkGrey, size: 18),
                          Text(' $formattedDuration',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGrey))
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Chip(
                      backgroundColor: disabled ? kDisabled : kDarkGreen,
                      label: Row(
                        children: [
                          Icon(Icons.label, color: kDarkGrey, size: 18),
                          Text(' $lessons lessons',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGrey))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
