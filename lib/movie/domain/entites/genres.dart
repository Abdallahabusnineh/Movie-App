import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String name;
  final int id;

  Genres({required this.name, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[id,name];
}
