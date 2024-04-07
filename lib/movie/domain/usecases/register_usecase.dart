import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';

class RegisterUseCase extends BaseUseCase<LoginSuccess,RegisterParameter>{
  BaseMoviesRepository baseMoviesRepository;
  RegisterUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, LoginSuccess>> call(RegisterParameter parameters) async {
  return await baseMoviesRepository.registerMovieApp(parameters);
  }

}