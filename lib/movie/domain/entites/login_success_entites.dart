import 'package:equatable/equatable.dart';
import 'package:moviesapp/movie/data/modules/login_model.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';

class LoginSuccess extends Equatable {
  bool status;

  String message;

  LoginUserData ?data;

  LoginSuccess({
    required this.status,
    required this.message,
    required this.data,

  });
  @override
  // TODO: implement props
  List<Object?> get props =>[message,data,status];


/*LoginSuccessModel.fromJson(Map<String, dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    data =    json['data'] != null ? LoginUserDataModel.fromJson(json['data']) : null;
  }*/





}