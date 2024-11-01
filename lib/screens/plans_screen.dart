import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/blocs/plan_bloc.dart';
import 'package:task3/screens/meal_details_screen.dart';

import '../configuration/app_states.dart';
import '../configuration/app_theme.dart';
import '../configuration/custom_text_widget.dart';
import '../models/meal_model.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        centerTitle: false,
        title:const CustomTextWidget(
          text:'Plan',

        ),
        actions: [
          InkWell(
            child: Image.asset('assets/icons/search.png'),
          )
        ],
      ),
      body: BlocBuilder<PlanBloc, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is FailureState){
            return Center(
              child: Text(state.error),
            );
          }
          else if(state is EmptyState){
            return const Center(
              child: Text('No items in the cart'),
            );
          }
          else if(state is LoadedState) {
            List<MealModel> plansItemsList = state.data as List<MealModel>;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.separated(

                  itemBuilder: (context, index) => Row(
                    children: [

                      SizedBox(
                        height: 57,
                        width: 57,
                        child: Image.asset(
                          plansItemsList[index].image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16,),
                          CustomTextWidget(
                            text: plansItemsList[index].name,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 4,),
                          CustomTextWidget(
                            text: plansItemsList[index].description,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 4,),
                          CustomTextWidget(
                            text: '${plansItemsList[index].price} AED',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.primaryColor,
                          ),
                          const SizedBox(height: 16,),

                        ],
                      ),
                      const Spacer(),

                     Align(
                       alignment: Alignment.centerRight,
                         child: IconButton(onPressed: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => MealDetailsScreen(meal: plansItemsList[index]),
                             ),
                           );

                         }, icon: const Icon(Icons.arrow_forward_ios_outlined)))
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                    child: Divider(),
                  ),
                  itemCount:plansItemsList.length
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
