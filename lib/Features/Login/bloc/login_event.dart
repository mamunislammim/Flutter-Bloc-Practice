part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginPressedEvent extends LoginEvent {
  String cid;
  String userID;
  String password;
  LoginPressedEvent(this.cid, this.userID, this.password);
}
