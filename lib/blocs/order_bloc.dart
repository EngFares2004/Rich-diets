// order_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configuration/app_events.dart';
import '../configuration/app_states.dart';
import '../models/meal_model.dart';

class OrderBloc extends Bloc<AppEvent, AppState> {
  OrderBloc() : super(LoadingState()) {
  on<LoadCartItems>((event, emit) {
      List<MealModel> cartItems = [];
      emit(OrderLoaded(5,cartItems, 0, calculateTotal(5,cartItems,_calculateDiscount(''))));
    });

    on<ApplyVoucher>((event, emit) {
      final discount = _calculateDiscount(event.voucherCode);
      final currentState = state as OrderLoaded;
      emit(OrderLoaded(
        currentState.tex,
        currentState.cartItems,
        currentState.discount,
        calculateTotal(currentState.tex,currentState.cartItems,currentState.discount),
      ));
    });

    on<UpdateDiscount>((event, emit) {
      if (state is OrderLoaded) {
        final currentState = state as OrderLoaded;
        emit(OrderLoaded(
          currentState.tex,
          currentState.cartItems,
          event.discount,
          calculateTotal(currentState.tex,currentState.cartItems, currentState.discount),
        ));
      }

    });
  }


  num calculateTotal(tex,List<MealModel> cartItems,  discount ) {
   // num subtotal = cartItems.fold(0, (sum, item) => sum + item.price);
    return 450 - (discount / 100 * 450)+tex;
  }

  num _calculateDiscount(String voucherCode) {
    if (voucherCode == 'DISCOUNT10') return 10;
    return 0;
  }
}
