import 'package:moviesapp/movie/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData{
 const LoginUserDataModel({required super.id, required super.token, required super.name, required super.email, required super.phone});

 factory LoginUserDataModel.fromJson(Map<String,dynamic>?json)=>LoginUserDataModel(
   id :json?['id'],
   name:json?['name'],
   email:json?['email'],
   phone:json?['phone'],
   token: json?['token']

 );

}