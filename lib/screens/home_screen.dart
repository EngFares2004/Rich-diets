import 'package:flutter/material.dart';
import 'package:task3/configuration/app_theme.dart';
import '../configuration/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F2EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Delivering to',
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                      ),
                      CustomTextWidget(
                        text: 'Dubai, Street 55 Dub Tower',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Container(
                    height: 41,
                    width: 41,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: InkWell(
                      child: Image.asset('assets/icons/search.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 192,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/post.png', fit: BoxFit.cover),
            ),
            _buildPosts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(BuildContext context) {
    final categories = [
      'assets/images/burger.png',
      'assets/images/pizza.png',
      'assets/images/burger.png',
      'assets/images/pizza.png',
    ];

    final hotDeals = [
      'assets/images/post2.png',
      'assets/images/post2.png',
      'assets/images/post2.png',
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildScrollableSection(
            title: 'Categories 😎',
            items: categories,
            itemHeight: 81,
            isHorizontal: true,
          ),
          const SizedBox(height: 24),
          _buildScrollableSection(
            title: 'Hot Deals',
            items: hotDeals,
            itemHeight: 146,
            isHorizontal: false,
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableSection({
    required String title,
    required List<String> items,
    required double itemHeight,
    required bool isHorizontal,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: title,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: isHorizontal ? itemHeight : itemHeight * items.length,
          child: ListView.separated(
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 16,
              height: 16,
            ),
            itemBuilder: (context, index) {
              return Image.asset(
                items[index],
                height: itemHeight,
               // width: itemHeight,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    );
  }
}
