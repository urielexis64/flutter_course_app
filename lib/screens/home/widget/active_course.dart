import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActiveCourse extends StatelessWidget {
  const ActiveCourse(
      {required this.title,
      required this.lessonsLeft,
      required this.courseProgress,
      required this.courseImageUrl});

  final String title;
  final String lessonsLeft;
  final String courseProgress;
  final String courseImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: kBackground,
        border: Border.all(color: kFontLight.withOpacity(0.1), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                courseImageUrl,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              )),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                '$lessonsLeft lessons left',
                style: TextStyle(
                  color: kFontLight,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(),
          CircularPercentIndicator(
              center: Text('$courseProgress%',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
              progressColor: kAccent,
              backgroundColor: kCardBackground,
              circularStrokeCap: CircularStrokeCap.round,
              percent: double.parse(courseProgress) / 100,
              radius: 50)
        ],
      ),
    );
  }
}
