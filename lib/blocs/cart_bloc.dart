import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/data/list_cart.dart';

import '../configuration/app_events.dart';
import '../configuration/app_states.dart';
import '../models/meal_model.dart';

class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(LoadingState()){
    on<GetDataEvent>(getCartItems);
    on<AddEvent>(increaseItemQuantity);
    on<RemoveEvent>(decreaseItemQuantity);
    add(GetDataEvent());
  }

  //======================================
  //====================================== Variables
  //======================================
  List<MealModel> cartItemsList = [];

  //======================================
  //====================================== Functions
  //======================================
  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
          () {
        return List.generate(
          listCart.length,
              (index) => MealModel(
            id: index,
            name: listCart[index]['name'],
            price: listCart[index]['price'],
            image: listCart[index]['images'],
            description:listCart[index]['desc'],
          ),
        );
      },
    );
  }
  void _increaseItemQuantity(int id) {
    for(var item in cartItemsList){
      if(item.id == id){
        item.quantity++;
        item.price =listCart[id]['price']*item.quantity;
        break;
      }
    }
  }
  void _decreaseItemQuantity(int id) {
    for(var item in cartItemsList){
      if(item.id == id &&item.quantity>0){
        item.quantity--;
        item.price =listCart[id]['price']*item.quantity;
        break;
      }
    }
  }
  //======================================
  //====================================== Events
  //======================================
  getCartItems(GetDataEvent event,Emitter emit) async{
    emit(LoadingState());
    try{
      cartItemsList = await _requestCartItems();
      if(cartItemsList.isNotEmpty){
        emit(LoadedState(cartItemsList));}
      else{
        emit(EmptyState());
      }
    }
    catch(e){
      emit(FailureState(e.toString()));
    }
  }
  increaseItemQuantity(AddEvent event,Emitter emit){
    int id = event.data;
    _increaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
  decreaseItemQuantity(RemoveEvent event,Emitter emit){
    int id = event.data;
    _decreaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
}
