import 'package:flutter_bloc/flutter_bloc.dart';
import '../configuration/app_events.dart';
import '../configuration/app_states.dart';

class RegistrationBloc extends Bloc<AppEvent, AppState> {
  RegistrationBloc() : super(InitState()) {
    on<RegistrationButtonPressed>(login);
  }

  Future<void> login(RegistrationButtonPressed event, Emitter<AppState> emit) async {
    emit(LoadingState());


    await networkDelay();

    if (event.email == 'admin@gmail.com' &&event.name== 'admin' && event.password == 'Admin@123') {


      emit(SuccessState());
    } else {
      emit(FailureState('Invalid username or password'));
    }
  }

  Future<void> networkDelay() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}
