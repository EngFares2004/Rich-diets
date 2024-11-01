import 'package:flutter/material.dart';
import 'package:task3/configuration/app_routes.dart';
import 'package:task3/configuration/app_theme.dart';
import 'package:task3/screens/auth_screens/widget_auth/custom_appbar.dart';
import 'package:task3/screens/auth_screens/widget_auth/text_auth_screens.dart';

import '../../configuration/custom_button.dart';
import 'widget_auth/custom_text_field.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyForgotPassword = GlobalKey<FormState>();
    String email = '';
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(iconButton: 'assets/icons/back.png',onclick: (){
              Navigator.pop(context);
            },),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextAuthScreens(title:'Forgot Password' , desc: "We'll Send the link to the email you'll provide below"),

                  const SizedBox(height: 24),
                  Form(
                    key: formKeyForgotPassword ,
                    child: Column(
                      children: [
                        CustomTextField(
                          onChanged: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.name,
                          hint: "Email Address",
                          validator: (value) {
                            const pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$";
                            final regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              return "Required Input Field";
                            }
                            if (!regExp.hasMatch(value)) {
                              return "Enter a correct value";
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(onClink:(){
                    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
                  }, txtButton: 'Send the reset link'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


