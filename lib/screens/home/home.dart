import 'package:course_app/constants/colors.dart';
import 'package:course_app/screens/detail/detail_page.dart';
import 'package:course_app/screens/home/widget/active_course.dart';
import 'package:course_app/screens/home/widget/category_title.dart';
import 'package:course_app/screens/home/widget/course_card.dart';
import 'package:course_app/screens/home/widget/emoji_text.dart';
import 'package:course_app/screens/home/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmojiText(),
            SearchBar(),
            CategoryTitle(title: 'Top of the week'),
            Container(height: 270, child: _buildListView()),
            CategoryTitle(title: 'Currently active'),
            Container(height: 330, child: _buildActiveListView()),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Hello, Uriel!',
          style: TextStyle(
            color: kFontLight,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kFontLight.withOpacity(0.3),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.notifications_none, color: kFontLight),
            ),
            Positioned(
                top: 15,
                right: 30,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: kAccent,
                    shape: BoxShape.circle,
                  ),
                ))
          ],
        )
      ],
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: data.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          description:
                              "How we developed speech and how it became such a powerful tool, let's see.",
                          title: data[index]['courseTitle']!,
                          imageUrl: data[index]['courseImageUrl']!,
                        )));
          },
          child: CourseCard(
            username: data[index]['username']!,
            userUrl: data[index]['userUrl']!,
            courseTitle: data[index]['courseTitle']!,
            courseDuration: data[index]['courseDuration']!,
            courseImageUrl: data[index]['courseImageUrl']!,
          ),
        );
      },
    );
  }

  ListView _buildActiveListView() {
    return ListView.separated(
      itemCount: data.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24),
      separatorBuilder: (context, index) {
        return SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return ActiveCourse(
          title: data[index]['courseTitle']!,
          courseProgress: '50',
          lessonsLeft: '3',
          courseImageUrl: data[index]['courseImageUrl']!,
        );
      },
    );
  }

  final data = [
    {
      'username': 'Rona Dida',
      'userUrl':
          'https://i.pinimg.com/originals/7f/40/b1/7f40b1317266c37052c17bc66d570a56.jpg',
      'courseTitle': 'Paint techniques',
      'courseDuration': '2h 22min',
      'courseImageUrl':
          'https://miro.medium.com/max/1400/0*s3jJ0DvPNxNI4Fka.jpg',
    },
    {
      'username': 'Uriel Aispuro',
      'userUrl':
          'https://cdna.artstation.com/p/assets/images/images/009/317/014/large/tess-mathey-guy.jpg?1518293186',
      'courseTitle': 'Flutter Pros',
      'courseDuration': '6h 32min',
      'courseImageUrl':
          'https://sysquoinnovation.com/wp-content/uploads/2021/10/CM_Cross-platform-dev_FB.png',
    },
    {
      'username': 'Chris Evans',
      'userUrl':
          'https://thumbs.dreamstime.com/b/hombre-en-su%C3%A9ter-con-mochila-estudiante-var%C3%B3n-aislado-jeans-de-y-beige-universitario-vector-urbano-cauc%C3%A1sico-negocios-americano-199257961.jpg',
      'courseTitle': 'Fitness Hacker',
      'courseDuration': '1h 17min',
      'courseImageUrl':
          'http://unblast.com/wp-content/uploads/2020/03/Girl-Fitness-Vector-Illustration.jpg',
    },
  ];
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackground,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: kBackground,
              border: Border(bottom: BorderSide(color: kAccent, width: 2)),
            ),
            child: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
