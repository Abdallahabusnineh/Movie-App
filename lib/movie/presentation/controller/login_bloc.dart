import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/usecases/login_usecase.dart';
import 'package:moviesapp/movie/presentation/controller/login_event.dart';
import 'package:moviesapp/movie/presentation/controller/login_state.dart';

class LoginBloc extends Bloc<AbstractLoginEvent, LoginState> {
  bool showPassword = true;
  IconData iconData = Icons.remove_red_eye_outlined;

  static LoginBloc getBlocObject(context) {
    return BlocProvider.of(context);
  }

  GetLoginUseCase getLoginUseCase;

  LoginBloc(this.getLoginUseCase) : super(LoginInitialState()) {
    on<LoginEventSuccess>((event, emit) async {
      emit(LoginLoadingState());
      final result =
          await getLoginUseCase(LoginParameter(event.email, event.password));
      result.fold((l) => emit(LoginServerFaulire(l.message)), (r) {
        if (r.status)
          emit(LoginSuccessState(r));
        else {
          emit(LoginErrorState(r.message));
        }
      });
    });

    on<ShowPassWordEvent>((event, emit) {
      showPassword = !showPassword;
      if (showPassword) {
        iconData = Icons.remove_red_eye;
      } else {
        iconData = Icons.remove_red_eye_outlined;
      }
      emit(IconDataChanged());
    });
  }
}
