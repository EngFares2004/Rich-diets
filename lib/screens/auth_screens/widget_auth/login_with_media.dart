import 'package:flutter/material.dart';
import 'package:task3/configuration/app_theme.dart';


class LoginWithMedia extends StatelessWidget {
  final Color colorTextButton;
  final Color colorButton;
  final String textButton;
  final String iconButton;

  const LoginWithMedia(
      {super.key,
      required this.colorTextButton,
      required this.colorButton,
      required this.iconButton,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all( 20),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.backgroundColor,
            radius: 14,
            child: Image.asset(
              iconButton,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 6,),
          Text(textButton,style: TextStyle(
            color: colorTextButton,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),)
        ],
      ),
    );
  }

}
class ShowButtonMedia extends StatelessWidget {


  const ShowButtonMedia(
      {super.key,});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
               Expanded(
                child: InkWell(
                  onTap: (){},
                  child: LoginWithMedia(

                    iconButton: 'assets/images/facebook.png',
                    textButton: 'Facebook',
                    colorTextButton: AppTheme.colorFacebookMedia,
                     colorButton:  AppTheme.colorButtonFacebookMedia
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: LoginWithMedia(
                      iconButton: 'assets/images/google.png',
                      textButton: 'Google',
                      colorTextButton: AppTheme.colorGoogleMedia,
                        colorButton:  AppTheme.colorButtonGoogleMedia
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(child: Divider()),
              Text(
                "   OR   ",
                style: TextStyle(color: AppTheme.primaryColor),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 24),
        ],
      );
    }


}
