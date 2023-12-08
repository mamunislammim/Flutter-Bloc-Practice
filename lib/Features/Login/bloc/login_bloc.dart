import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_practice/Repository/repository.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      String status = await Repository().loginApi(event.cid, event.userID, event.password);
      emit(LoginLoadedState(status));
    });
  }
}
