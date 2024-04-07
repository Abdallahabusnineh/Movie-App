import 'package:moviesapp/core/network/error_massage_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const  ServerException( {required this.errorMessageModel});

}

 class LocalDatabaseException implements Exception{
   final String errorMessage;

 const LocalDatabaseException({required this.errorMessage});


 }