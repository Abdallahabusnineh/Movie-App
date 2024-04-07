import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entites/movie_detail.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';


class GetMovieDetailsUseCases extends BaseUseCase<MovieDetail,MovieDetailsParameter>{
  final BaseMoviesRepository baseMoviesRepository;

   GetMovieDetailsUseCases(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameter parameter) async {
 return await  baseMoviesRepository.getDetailMovie(parameter);
  }

}

/*class MovieDetailsParameter extends Equatable{
  final int movieId;


  const MovieDetailsParameter({required this.movieId});


  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}*/
