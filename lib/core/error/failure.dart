import 'package:equatable/equatable.dart';
// message هي المشتركة بين الداتا اللوكال او الريمتولية ف عشان هيك بهندلها لحالها
// هاد الكلاس model عشان الايروات وال failure
abstract class Failure extends Equatable{
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props=>[message];
}

class ServerFailure extends Failure{
  const ServerFailure(super.message);

}
class DatabaseFailure extends Failure{
  const DatabaseFailure(super.message);

}