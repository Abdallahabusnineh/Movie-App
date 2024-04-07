import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?name;
  final int ?id;
  final String ?token;

  final String ?email;
  final String ?phone;

  const LoginUserData({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone,id,token];
}
