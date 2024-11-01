import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/configuration/app_routes.dart';
import 'package:task3/configuration/custom_button.dart';
import 'package:task3/screens/auth_screens/widget_auth/custom_text_field.dart';
import 'package:task3/screens/auth_screens/widget_auth/login_dialog_helper.dart';
import 'package:task3/screens/auth_screens/widget_auth/login_with_media.dart';

import '../../blocs/Login_bloc.dart';
import '../../configuration/app_events.dart';
import '../../configuration/app_states.dart';
import '../../configuration/app_theme.dart';
import 'widget_auth/custom_appbar.dart';
import 'widget_auth/text_auth_screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: SingleChildScrollView(
          child: BlocListener<LoginBloc, AppState>(
            listener: (context, state) {
              if (state is SuccessState) {
                LoginDialogHelper.showSuccessDialog(context);
              }
              else if (state is FailureState) {
               LoginDialogHelper.showErrorDialog(context, state.error);
              }
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextAuthScreens(
                          title: 'Welcome Back!',
                          desc: "Have a healthy & Tasty day ahead"),
                      const ShowButtonMedia(),
                      const LoginForm(),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(

                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes
                                .forgotPassword);
                          },

                          child: const Text(
                            " Forgot Password?",
                            style:
                            TextStyle(color: AppTheme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          ),
                        ),),

                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRoutes.signUp);
                            },

                            child: const Text(
                              " Create new one",
                              style:
                              TextStyle(color: AppTheme.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


class LoginForm extends StatefulWidget {



  const LoginForm(
      {super.key,});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = true;
  String _email = '';
  String _password = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            onChanged: (value) {
             _email = value;
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

          const SizedBox(height: 16,),
          CustomTextField(
            onChanged: (value) {
              _password = value;
            },
            keyboardType: TextInputType.visiblePassword,
            isPassword: obscureText,

            hint: "Password",
            validator: (value) {
              const pattern =
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
              final regExp = RegExp(pattern);

              if (value!.isEmpty) {
                return "Required Input Field";
              }

              if (value.length < 8) {
                return "Password must be at least 8 characters";
              }
              if (!regExp.hasMatch(value)) {
                return "Password must include upper, lower, number & special character";
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginBloc, AppState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child:CircularProgressIndicator() ,) ;
              }
              return CustomButton(onClink: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginButtonPressed(

                      email: _email,
                      password:_password,

                    ),
                  );
                }
              },
                  txtButton: 'Login');
            },
          ),
        ],
      ),
    );
  }
}
