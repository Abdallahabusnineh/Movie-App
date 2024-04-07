import 'package:moviesapp/movie/data/modules/login_model.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';

class LoginSuccessModel extends LoginSuccess {
  LoginSuccessModel(
      {required super.status, required super.message, required super.data});

  factory LoginSuccessModel.fromJson(Map<String, dynamic>json)=>
      LoginSuccessModel(

        status: json['status'],
        message: json['message'],
        data: LoginUserDataModel.fromJson(json['data']),
      );
}