import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'widget/blur_button.dart';
import 'widget/module_card.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 12 / 11,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(32)),
                      child: Image.network(imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 32,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: BlurButton(
                          icon: Icons.chevron_left_rounded,
                        ),
                      )),
                  Positioned(
                      top: 50,
                      right: 32,
                      child: BlurButton(
                        icon: Icons.bookmark,
                      )),
                  Positioned(
                    bottom: 0,
                    right: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Start class',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/originals/7f/40/b1/7f40b1317266c37052c17bc66d570a56.jpg'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Rona Dida • ',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Icon(
                      Icons.schedule_rounded,
                      color: kAccent,
                      size: 16,
                    ),
                    Text(' 1h 35min',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                SizedBox(height: 10),
                Text(description,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 16)),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('The progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.apps_rounded,
                          size: 28,
                          color: kDarkGrey.withOpacity(0.2),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.tune_rounded, size: 28),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ModuleCard(
                  duration: 22,
                  title: 'MODULE 1',
                  lessons: 2,
                  subtitle: '''How it all started.\nExplanation''',
                ),
                ModuleCard(
                  duration: 12,
                  title: 'MODULE 2',
                  lessons: 2,
                  subtitle: '''What we didn't know about catastrophe''',
                  disabled: true,
                ),
                ModuleCard(
                  duration: 12,
                  title: 'MODULE 3',
                  lessons: 9,
                  subtitle: '''What we didn't know about catastrophe''',
                  disabled: true,
                ),
                ModuleCard(
                  duration: 123,
                  title: 'MODULE 4',
                  lessons: 22,
                  subtitle: '''What we didn't know about catastrophe''',
                  disabled: true,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
