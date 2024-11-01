import '../models/meal_model.dart';

abstract class AppState{}

class LoadingState extends AppState{}
class FailureState extends AppState {
  final String error;

  FailureState(this.error);
}
class LoadedState extends AppState{
  final dynamic data;

  LoadedState(this.data);
}
class EmptyState extends AppState{}
class SuccessState extends AppState{}
class InitState extends AppState{}
class OrderLoaded extends AppState {
  final List<MealModel> cartItems;
  final num discount;
  final num tex;
  final num totalAmount;


  OrderLoaded(this.tex,this.cartItems, this.discount, this.totalAmount);
}