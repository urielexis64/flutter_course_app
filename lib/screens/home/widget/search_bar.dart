import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: kFontLight.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
            cursorColor: kFontLight,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kAccent,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              fillColor: kFontLight.withOpacity(.05),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              border: InputBorder.none,
              hintText: 'Search for history, classes...',
              hintStyle: TextStyle(color: kFontLight),
            )));
  }
}
