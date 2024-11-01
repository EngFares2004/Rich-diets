import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../configuration/custom_text_widget.dart';
import '../configuration/app_theme.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealModel meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Meal Details'),
        backgroundColor: AppTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              meal.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            CustomTextWidget(
              text: meal.name,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomTextWidget(
              text: meal.description,
              fontSize: 16,
            ),
            const SizedBox(height: 16),
            CustomTextWidget(
              text: '${meal.price} AED',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
