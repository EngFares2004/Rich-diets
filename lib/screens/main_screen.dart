
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/blocs/plan_bloc.dart';
import 'package:task3/configuration/app_theme.dart';
import 'package:task3/screens/cart_screen.dart';
import 'package:task3/screens/home_screen.dart';
import 'package:task3/screens/order_screen/order_screen.dart';
import 'package:task3/screens/plans_screen.dart';
import 'package:task3/screens/profile_screen.dart';

import '../blocs/cart_bloc.dart';
import '../blocs/order_bloc.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final List<Widget> myPages = [
    const HomeScreen(),
    BlocProvider(create: (_) => PlanBloc(), child: const PlansScreen()),
    BlocProvider(create: (_) => CartBloc(), child: const CartScreen()),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: myPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: const Color(0xffBFBFBF),
        iconSize: 32,

        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon:  ImageIcon(
              AssetImage("assets/icons/home.png"),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(
              AssetImage("assets/icons/reserve.png"),
            ),
            label: "Plans",
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(
              AssetImage("assets/icons/bag.png"),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon:  ImageIcon(
              AssetImage("assets/icons/order.png"),
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
