import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/data/modules/login_success_model.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';

abstract class LoginState{

}

class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState {
  final LoginSuccess loginSuccess ;
  LoginSuccessState(this.loginSuccess);

}
class LoginServerFaulire extends LoginState{
  final String errorMessage;

  LoginServerFaulire(this.errorMessage);

}
class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState(this.error);

}
class IconDataChanged extends LoginState{}