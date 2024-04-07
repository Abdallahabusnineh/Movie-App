abstract class AbstractRegisterEvent {}

class RegisterEventSuccess extends AbstractRegisterEvent{
  final String email;
  final String password;
  final String name;
  final String phoneNumber;

  RegisterEventSuccess(this.email, this.password, this.name, this.phoneNumber);
}

class RegisterShowPassWordEvent extends AbstractRegisterEvent{
}