import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';

class GetLoginUseCase extends BaseUseCase<LoginSuccess,LoginParameter>{
BaseMoviesRepository baseMoviesRepository;
GetLoginUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure,LoginSuccess>> call(LoginParameter parameters) async {
    return await baseMoviesRepository.loginMovieApp(parameters);
  }
}
