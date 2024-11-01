import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/configuration/app_events.dart';

import '../../blocs/cart_bloc.dart';
import '../../blocs/order_bloc.dart';
import '../../configuration/app_states.dart';
import '../../configuration/app_theme.dart';
import '../../configuration/custom_button.dart';
import '../../configuration/custom_text_widget.dart';
import '../../models/meal_model.dart';
import '../auth_screens/widget_auth/custom_text_field.dart';
import 'widget_order/custom_dropdown_container.dart';
import 'widget_order/delivery_pickup.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      OrderBloc()
        ..add(LoadCartItems()),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.backgroundColor,
          title: const CustomTextWidget(
            text: 'Order',
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<OrderBloc, AppState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is FailureState) {
              return Center(child: CustomTextWidget(text: state.error));
            }
            else if (state is OrderLoaded) {
              return SingleChildScrollView(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const ListItems(),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(text: 'Voucher'),
                          const SizedBox(height: 8),
                          CustomTextField(
                            prefixIcon: const ImageIcon(color: AppTheme.primaryColor,
                              AssetImage("assets/icons/receipt-item.png"),
                            ),
                            hint: 'Enter the voucher',
                            onChanged: (value) {
                              BlocProvider.of<OrderBloc>(context)
                                  .add(UpdateDiscount(num.parse(value)));
                            },
                            suffix: InkWell(
                              onTap: () {
                                BlocProvider.of<OrderBloc>(context)
                                    .add(ApplyVoucher('VOUCHER_CODE'));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: CustomTextWidget(
                                  text: 'Apply',

                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 29),
                          const CustomTextWidget(
                            text: 'Choose the method',
                          ),
                          const SizedBox(height: 16),
                          const DeliveryPickup(),
                          const SizedBox(height: 24),
                          const CustomTextWidget(
                            text: 'Select a branch',

                          ),
                          const SizedBox(height: 8),
                          CustomDropdownContainer(onSelected: (val) {},),
                          const SizedBox(height: 24),
                          const CustomTextWidget(
                            text: 'Order Summary',

                          ),
                          const SizedBox(height: 16),
                          _buildOrderSummary(state),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  txtButton: 'Add More items',
                                  textFontButton: 14,
                                  onClink: () {},
                                  colorButton: const Color(0xffEDEDED),
                                  colorTextButton: AppTheme.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomButton(
                                  txtButton: 'Checkout',
                                  onClink: () {},
                                  textFontButton: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildOrderSummary(OrderLoaded state) {
    return Column(
      children: [
        const Divider(color: Colors.grey,),
        const SizedBox(height: 16),
        _buildSummaryRow('Subtotal', '450 AED'),
        const SizedBox(height: 16),
        _buildSummaryRow('Tax', '${state.tex} AED'),
        const SizedBox(height: 16),
        const Divider(color: Colors.grey,),
        const SizedBox(height: 16),
        _buildSummaryRow('Total Amount', '${state.totalAmount} AED',
            isBold: true),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: label,
          fontSize: 16,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        CustomTextWidget(
          text: value,
          fontSize: 16,

          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ],
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: BlocBuilder<CartBloc, AppState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is FailureState) {
              return Center(
                child: Text(state.error),
              );
            }
            else if (state is EmptyState) {
              return const Center(
                child: Text('No items in the cart'),
              );
            }
            else if (state is LoadedState) {
              List<MealModel> cartItems = state.data as List<MealModel>;
              return SizedBox(
                height: 150 * (cartItems.length).toDouble(),
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 33),
                            child: Row(
                              children: [
                                Image.asset(
                                  cartItems[index].image,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: cartItems[index].description,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 4),
                                    CustomTextWidget(
                                      text: '${cartItems[index].price} AED',
                                      color: AppTheme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                  itemCount: cartItems.length,
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
