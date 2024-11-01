import 'package:flutter/material.dart';

import '../../../configuration/app_theme.dart';

class TextAuthScreens extends StatelessWidget {
  final String title ;
  final String desc;
 const TextAuthScreens({super.key , required this.title ,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30.0),
        Text(title,style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppTheme.textTitleColor
        ),),
        const SizedBox(height: 8,),
        Text(desc,style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppTheme.textDescAuthColor
        ),),
      ],
    );
  }
}
