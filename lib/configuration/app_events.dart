import '../models/meal_model.dart';

abstract class AppEvent {}

class ClickEvent extends AppEvent {}

class AddEvent extends AppEvent {
  final dynamic data;

  AddEvent(this.data);
}

class RemoveEvent extends AppEvent {
  final dynamic data;

  RemoveEvent(this.data);
}

class SearchEvent extends AppEvent {}

class GetDataEvent extends AppEvent {}

class LoginButtonPressed extends AppEvent {
  final String email;
  final String password;

  LoginButtonPressed( {required this.email, required this.password});
}

class RegistrationButtonPressed extends AppEvent{
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  RegistrationButtonPressed(
      {
     this.name ="",
     this.email =' ',
    this.password='',
    this.confirmPassword='',
  });
}

class LoadCartItems extends AppEvent {

}

// order_event.dart


class ApplyVoucher extends AppEvent {
  final String voucherCode;
  ApplyVoucher(this.voucherCode);
}


class UpdateDiscount extends AppEvent {
  final num discount;
  UpdateDiscount(this.discount);
}








