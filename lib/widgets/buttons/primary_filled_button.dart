import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryFilledButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: Styles.tsWhiteRegular20,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
