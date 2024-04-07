import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/network/ApiConstance.dart';
import 'package:moviesapp/core/network/dio_helper.dart';
import 'package:moviesapp/core/network/error_massage_model.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/core/utils/app_constance.dart';
import 'package:moviesapp/movie/data/modules/login_model.dart';
import 'package:moviesapp/movie/data/modules/login_success_model.dart';
import 'package:moviesapp/movie/data/modules/movie_details_model.dart';
import 'package:moviesapp/movie/data/modules/movie_model.dart';
import 'package:moviesapp/movie/data/modules/recommendation_model.dart';
import 'package:moviesapp/movie/domain/entites/login_entites.dart';
import 'package:moviesapp/movie/domain/entites/login_success_entites.dart';
import 'package:moviesapp/movie/domain/entites/recomindation.dart';

import 'package:moviesapp/movie/domain/usecases/get_movie_detail_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parametres);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parametres);
  Future<LoginSuccessModel?> loginMovieApp(LoginParameter parameters);
  Future<LoginSuccessModel?> registerMovieApp(RegisterParameter parameters);



}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  //بعمل ميثود عشان تساعدني انادي على البيانات اللي طلبتها بل usecase
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().
    get(ApiConstance.nowPlayingMoviePath);

    if (response.statusCode == 200) {//من ال api هو محدد انو 200 عملية ناجحة
      return List<MovieModel>.from((response.data["results"] as List)// استقبل الداتا كأنها list
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async{
    final response=await Dio().get(ApiConstance.popularMoviePath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    }




  @override
  Future<List<MovieModel>> getTopRatedMovie()async {
    final response=await Dio().get(ApiConstance.topRatedMoviePath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parametres) async {
    final response=await Dio().get(ApiConstance.getDetailsMoviePath(parametres.movieId));
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parametres) async {
    final response=await Dio().get(ApiConstance.getRecommendationPath(parametres.id));
    if(response.statusCode==200){
      return List<RecommendationModel>.from((response.data['results']as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<LoginSuccessModel?> loginMovieApp(
      LoginParameter parameters
      )async {
     final result =await DioHelper.postData(url:login , data:{
       'email':parameters.email,
       'password':parameters.password
     });
if(result.statusCode==200)
  return LoginSuccessModel.fromJson(result?.data);
else
  throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<LoginSuccessModel?> registerMovieApp(RegisterParameter parameters)async {
   final result =await DioHelper.postData(url:register, data:{
     'email':parameters.email,
     'password':parameters.password,
     'name':parameters.name,
     'phone':parameters.phoneNumber
   });
   if (result.statusCode==200)
     return LoginSuccessModel.fromJson(result?.data);
   else
     throw ServerException(
         errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
  }




