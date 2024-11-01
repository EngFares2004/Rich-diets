import 'package:flutter/material.dart';

import 'app_theme.dart';


class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = AppTheme.textTitleColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}