
abstract class AbstractLoginEvent{}
 class LoginEventSuccess extends AbstractLoginEvent{
  final String email;
  final String password;

  LoginEventSuccess({required this.email, required this.password});

 }
  class ShowPassWordEvent extends AbstractLoginEvent{
  }

