part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState{}
class LoginLoadedState extends LoginState {
  final String status;
  LoginLoadedState(this.status);
}
