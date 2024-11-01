
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../configuration/app_events.dart';
import '../configuration/app_states.dart';
import '../configuration/app_theme.dart';
import '../configuration/custom_text_widget.dart';
import '../models/meal_model.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        centerTitle: false,
        title: const CustomTextWidget(
          text: 'Cart',



        ),

      ),
      body: BlocBuilder<CartBloc, AppState>(
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
            List<MealModel> cartItemsList = state.data as List<MealModel>;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.separated(

                itemBuilder: (context, index) {
                  return Dismissible(key:Key("$index"),

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        CustomTextWidget(
                          text: cartItemsList[index].description,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 4,),
                        CustomTextWidget(
                          text: '${cartItemsList[index].price} AED',
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(height: 4,),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all( color:  Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 8,),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<CartBloc>(context).add(RemoveEvent(cartItemsList[index].id));
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 24,),
                              Text('${cartItemsList[index].quantity}',
                                style: const TextStyle(
                                color: AppTheme.primaryColor,
                              ),),
                              const SizedBox(width: 24,),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<CartBloc>(context).add(AddEvent(cartItemsList[index].id));
                                },
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(width: 8,),

                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                      ],
                    ),
                    Image.asset(
                      cartItemsList[index].image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ));},
                separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  child: Divider(),
                ),
                itemCount: cartItemsList.length
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
