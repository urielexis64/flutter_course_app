import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key,
      required this.username,
      required this.userUrl,
      required this.courseTitle,
      required this.courseDuration,
      required this.courseImageUrl})
      : super(key: key);

  final String username;
  final String userUrl;
  final String courseTitle;
  final String courseDuration;
  final String courseImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        width: 270,
        height: 270,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kCardBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Image.network(
                        courseImageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                            position: DecorationPosition.foreground,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black26,
                                  Colors.transparent,
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage(userUrl),
                            ),
                            SizedBox(width: 8),
                            Text(
                              username,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              courseTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              ' • $courseDuration',
                              style: TextStyle(color: kFontLight, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 68,
              right: 24,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: kAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
