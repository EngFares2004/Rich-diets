import 'package:flutter_bloc/flutter_bloc.dart';
import '../configuration/app_events.dart';
import '../configuration/app_states.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(InitState()) {
    on<LoginButtonPressed>(login);
  }

  Future<void> login(LoginButtonPressed event, Emitter<AppState> emit) async {
    emit(LoadingState());


    await networkDelay();

    if (event.email == 'admin@gmail.com' && event.password == 'Admin@123') {


      emit(SuccessState());
    } else {
      emit(FailureState('Invalid username or password'));
    }
  }

  Future<void> networkDelay() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}
