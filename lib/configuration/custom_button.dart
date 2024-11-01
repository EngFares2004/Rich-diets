import 'package:flutter/material.dart';

import 'app_theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onClink;
  final String txtButton;
  final double textFontButton;
  final Color? colorButton;
  final Color? colorTextButton;

  const CustomButton({
    super.key,
    required this.onClink,
    required this.txtButton,
    this.colorButton = AppTheme.primaryColor,
    this.colorTextButton = Colors.white,
    this.textFontButton = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: colorButton,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onClink,

        child: Text(
          txtButton,
          style: TextStyle(
            color: colorTextButton,
            fontSize: textFontButton,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
