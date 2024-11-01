import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:task3/screens/main_screen.dart';

import '../../home_screen.dart';

class LoginDialogHelper {
  static void showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Success',
      desc: 'Login Successful',
      btnOkOnPress: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>const MainScreen(),
          ),
        );
      },
      btnOkIcon: Icons.check_circle,
    ).show();
  }

  static void showErrorDialog(BuildContext context, String error) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      title: 'Error',
      desc: error,
      btnOkOnPress: () {},
      btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
    ).show();
  } static void showCheckDialog(BuildContext context) {
    AwesomeDialog(

      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      dialogBackgroundColor: Colors.white,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Privacy Policy',
      titleTextStyle: const TextStyle(
          color: Colors.black
      ),
      desc: 'You need to agree to the privacy policy to continue.',
      descTextStyle: const TextStyle(
          color: Colors.black
      ),
      btnCancelOnPress: () {},



      onDismissCallback: (type) {
        debugPrint('Dialog Dismissed: $type');
      },
    ).show();  }
}
