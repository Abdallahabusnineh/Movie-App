import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/usecases/register_usecase.dart';
import 'package:moviesapp/movie/presentation/controller/register_event.dart';
import 'package:moviesapp/movie/presentation/controller/register_state.dart';

class RegisterBloc extends Bloc<AbstractRegisterEvent, RegisterState> {
  bool showPassword = true;
  IconData iconData = Icons.remove_red_eye_outlined;

  static RegisterBloc getBlocObject(context) {
    return BlocProvider.of(context);
  }

  RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterIntialState()) {
    on<RegisterEventSuccess>((event, emit) async {
      emit(RegisterLoadingState());
      final ruslut = await registerUseCase(RegisterParameter(
          event.email, event.password, event.name, event.phoneNumber));
      ruslut.fold((l) => emit(RegisterServerFailureState(l.message)), (r) {
        if(r.status)
          emit(RegisterSuccessState(r));
        else
          emit(RegisterServerFailureState(r.message));
      });
    });

    on<RegisterShowPassWordEvent>((event, emit) {
      showPassword=!showPassword;
      if(showPassword)
      {
        iconData=Icons.remove_red_eye;
      }
      else {
        iconData = Icons.remove_red_eye_outlined;
      }
      emit(RegisterIconDataChanged());
    });


  }
}
