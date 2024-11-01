import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/configuration/app_events.dart';
import 'package:task3/configuration/app_routes.dart';
import '../../blocs/registration_bloc.dart';
import '../../configuration/app_states.dart';
import '../../configuration/custom_button.dart';
import '../../configuration/app_theme.dart';
import 'widget_auth/custom_appbar.dart';
import 'widget_auth/custom_text_field.dart';
import 'widget_auth/login_dialog_helper.dart';
import 'widget_auth/login_with_media.dart';
import 'widget_auth/text_auth_screens.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: SingleChildScrollView(
          child: BlocListener<RegistrationBloc, AppState>(
            listener: (context, state) {
              if (state is SuccessState) {
                LoginDialogHelper.showSuccessDialog(context);
              } else if (state is FailureState) {
                LoginDialogHelper.showErrorDialog(context, state.error);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(iconButton: 'assets/icons/close.png',onclick: (){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                },),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextAuthScreens(
                          title: 'Create New Account',
                          desc: "Have a healthy & Tasty day ahead"),
                      const SizedBox(height: 24.0),
                      const ShowButtonMedia(),
                      const SizedBox(height: 24.0),
                      const RegistrationForm(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Already an existing user?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.login);
                            },
                            child: const Text(
                              " Login",
                              style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100,),
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

class RegistrationForm extends StatefulWidget {



  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKeyRegistration = GlobalKey<FormState>();
   bool obscureText = true;
   String _password = '';
   String _confirmPassword = '';
   String _email = '';
   String _username = '';
   bool _isChecked = false;

  String selectedCountryCode = "+971";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyRegistration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: (value) {
              _username = value;
            },
            keyboardType: TextInputType.name,
            hint: "Full Name",
            validator: (value) {
              const pattern = r"^[a-zA-Z\s'-_]{2,50}$";
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
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
             _email = value;
            },
            keyboardType: TextInputType.emailAddress,
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
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedCountryCode,
                      items: [
                        DropdownMenuItem(
                          value: "+971",
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/flags/use.png',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 8),
                              const Text("(+971)"),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "+20",
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/flags/egypt.png',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 4),
                              const Text("(+20)"),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "+1",
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/flags/united-states.png',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 8),
                              const Text("(+1)"),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCountryCode = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    onChanged: (val) {
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      const pattern = r'^\+?[0-9]{7,15}$';
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              _password = value;
            },
            keyboardType: TextInputType.visiblePassword,
            isPassword: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: obscureText ? Colors.black : AppTheme.primaryColor,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
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
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              _confirmPassword = value;
            },
            keyboardType: TextInputType.visiblePassword,
            isPassword: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: obscureText ? Colors.black : AppTheme.primaryColor,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            hint: "Confirm Password",
            validator: (value) {
              if (value!.isEmpty) {
                return "Required Input Field";
              }
              if (value !=_password) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
            },
            keyboardType: TextInputType.name,
            hint: "Enter referral code (Optional)",
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Checkbox(
                checkColor: AppTheme.primaryColor,
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                   _isChecked = value!;
                  });
                },
              ),
              const Text(
                "I Accept the",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                " terms & Conditions",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<RegistrationBloc, AppState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomButton(
                  onClink: () {
                    if (_isChecked == true) {
                      if (formKeyRegistration.currentState!
                          .validate()) {
                        BlocProvider.of<RegistrationBloc>(context)
                            .add(
                          RegistrationButtonPressed(
                              name: _username,
                              email: _email,
                              password: _password,
                              confirmPassword: _confirmPassword),
                        );
                      }
                    } else {
                      LoginDialogHelper.showCheckDialog(context);
                    }
                  },
                  txtButton: 'Create an account');
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
