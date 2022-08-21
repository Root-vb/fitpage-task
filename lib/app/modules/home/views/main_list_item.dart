import 'package:flutter/material.dart';
import 'package:starter/app/theme/styles.dart';

import '../../../theme/app_colors.dart';

class MainListItem extends StatelessWidget {
  final String heading;
  final String subheading;
  final String color;

  MainListItem(
      {required this.heading, required this.subheading, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 0.0),
          color: AppColors.white,
          width: 2.0,
          height: 2.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              text: heading,
              style: Styles.tsWhiteRegular18,
            )),
            const SizedBox(
              height: 4.0,
            ),
            RichText(
              text: TextSpan(
                  text: subheading,
                  style: TextStyle(
                    color: getColor(),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                  )),
            ),
            const SizedBox(
              height: 4.0,
            ),
            RichText(
                text: const TextSpan(
              text:
                  "....................................................................................",
              style: Styles.tsWhiteRegular18,
            ))
          ],
        ),
      ],
    );
  }

  Color getColor() {
    if (color == "red") {
      return AppColors.red;
    } else if (color == "green") {
      return AppColors.green;
    }
    return AppColors.white;
  }
}
