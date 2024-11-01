
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/data/list_plants.dart';

import '../configuration/app_events.dart';
import '../configuration/app_states.dart';
import '../models/meal_model.dart';

class PlanBloc extends Bloc<AppEvent, AppState> {
  PlanBloc() : super(LoadingState()){
    on<GetDataEvent>(getPlanItems);

    add(GetDataEvent());
  }


  //================= Variables =====================

  List<MealModel> planItemsList = [];

  //================== Functions ====================

  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return List.generate(
          listPlans.length,
          (index) => MealModel(
            id: index,
            name: listPlans[index]['name'],
            price: listPlans[index]['price'],
            image: listPlans[index]['images'],
            description:listPlans[index]['desc'],
          ),
        );
      },
    );
  }


  //================ Events ======================

  getPlanItems(GetDataEvent event,Emitter emit) async{
    emit(LoadingState());
    try{
      planItemsList = await _requestCartItems();
      if(planItemsList.isNotEmpty){
        emit(LoadedState(planItemsList));}
      else{
        emit(EmptyState());
      }
    }
    catch(e){
      emit(FailureState(e.toString()));
    }
  }
}
