import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entites/movie.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
final  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
return await baseMoviesRepository.getPopularMovie();
  }



}