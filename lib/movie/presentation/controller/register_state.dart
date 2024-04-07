import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';

abstract class RegisterState{}
class RegisterIntialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{
  final LoginSuccess loginSuccess ;
  RegisterSuccessState(this.loginSuccess);
}
class RegisterServerFailureState extends RegisterState{
  final String errorMessage;

  RegisterServerFailureState(this.errorMessage);
}
class RegisterIconDataChanged extends RegisterState{}
