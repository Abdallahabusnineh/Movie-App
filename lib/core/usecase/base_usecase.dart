import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movie/data/modules/movie_details_model.dart';

//بتاخذ مني شغلتين ال return والparameter
abstract class BaseUseCase<T,Parametres>{
Future<Either<Failure,T>>call( Parametres parameters);
}

class MovieDetailsParameter extends Equatable{
  final int movieId;

  const MovieDetailsParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];


}
class RecommendationParameters extends Equatable{
  final int id;

  const RecommendationParameters(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginParameter extends Equatable{
  final String email;
  final String password;

    LoginParameter(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}



class RegisterParameter extends Equatable{
  final String email;
  final String password;
final String phoneNumber;
final String name;

  RegisterParameter(this.email, this.password, this.phoneNumber, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,name,phoneNumber];

}