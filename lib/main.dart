import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/screens/auth_screens/forgot_password_screen.dart';
import 'package:task3/screens/auth_screens/login_screen.dart';
import 'package:task3/screens/auth_screens/registration_screen.dart';
import 'package:task3/screens/order_screen/order_screen.dart';
import 'package:task3/screens/plans_screen.dart';
import 'package:task3/screens/profile_screen.dart';
import 'package:task3/screens/splash_screen.dart';

import 'blocs/cart_bloc.dart';
import 'configuration/app_routes.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),

        AppRoutes.main: (context) => const MainScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.plans: (context) => const PlansScreen(),
        AppRoutes.order: (context) =>const OrderScreen(),

        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signUp: (context) => const RegistrationScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
        AppRoutes.cart: (context) =>
            BlocProvider(
                create: (context) => CartBloc(), child: const CartScreen()),
      },
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
