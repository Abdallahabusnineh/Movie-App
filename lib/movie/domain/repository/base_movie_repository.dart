import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/data/datasource/movie_remote_datasource.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';
import 'package:moviesapp/movie/domain/entites/movie.dart';
import 'package:moviesapp/movie/domain/entites/movie_detail.dart';
import 'package:moviesapp/movie/domain/entites/recomindation.dart';
import 'package:moviesapp/movie/domain/usecases/get_movie_detail_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';


abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>>  getNowPlayingMovie();
  Future<Either<Failure,List<Movie>>> getPopularMovie();
  Future<Either<Failure,List<Movie>>>  getTopRatedMovie();
  Future<Either<Failure,MovieDetail>>  getDetailMovie(MovieDetailsParameter parametres);
  Future<Either<Failure,List<Recommendation>>>  getRecommendation (
      RecommendationParameters parameters
      );
 Future<Either<Failure,LoginSuccess>> loginMovieApp(LoginParameter  parameters);
 Future<Either<Failure,LoginSuccess>> registerMovieApp(RegisterParameter  parameters);

}