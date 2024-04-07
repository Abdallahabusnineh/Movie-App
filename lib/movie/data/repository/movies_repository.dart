import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/network/error_massage_model.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/data/datasource/movie_remote_datasource.dart';
import 'package:moviesapp/movie/data/modules/recommendation_model.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';
import 'package:moviesapp/movie/domain/entites/movie.dart';
import 'package:moviesapp/movie/domain/entites/movie_detail.dart';
import 'package:moviesapp/movie/domain/entites/recomindation.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';
import 'package:moviesapp/movie/domain/usecases/get_movie_detail_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
// pakage dartz هي بتخليني استعمل ==>either
  // either  بتستخدمها لما بدك ترجع اوبجيكتين مختلفين ب نس الميثود
 //Failure هاي كلاس انا أنشئتها
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {// هون بنادي ال catach اللي مستعملها هناك
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovie() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetailMovie(MovieDetailsParameter parametres) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parametres);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LoginSuccess>> loginMovieApp(LoginParameter parameters) async {
    final result=await baseMovieRemoteDataSource.loginMovieApp(parameters);
    try{
      return Right(result as LoginSuccess );
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, LoginSuccess>> registerMovieApp(RegisterParameter parameters) async{
   final result=await baseMovieRemoteDataSource.registerMovieApp(parameters);
   try{
     return Right(result as LoginSuccess );
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }
}
