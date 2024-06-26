import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  bool success;

  ErrorMessageModel(
      {required this.statusCode, required this.statusMessage, required this.success});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        statusCode,
        statusMessage,
        success
      ];

  factory ErrorMessageModel.fromJson(Map<String, dynamic>json){
    return ErrorMessageModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success']
    );
  }


}