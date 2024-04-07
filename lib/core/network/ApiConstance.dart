import 'package:moviesapp/core/usecase/base_usecase.dart';

class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";

  static const String apiKey="74af7aac0c94cb3ab7d209fcc991df99";
  static const String nowPlayingMoviePath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String  popularMoviePath="$baseUrl/movie/popular?api_key=$apiKey";
  static const String  topRatedMoviePath="$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String  getDetailsMoviePath(int moviId){
   return "$baseUrl/movie/$moviId?api_key=$apiKey";
  }


  /*static   getUserEmailData(String password,String email){
    LoginParameter( email,  password);
  return email;
  }
  static   getUserPasswordData(String password,String email){
    LoginParameter( email, password);
    return password;
  }*/




  static  String  getRecommendationPath(int moviId){
    return "$baseUrl/movie/$moviId/recommendations?api_key=$apiKey";
  }
    static const String  baseImageUrl="https://image.tmdb.org/t/p/w500";
    static String  imageUrl(String path)=>'$baseImageUrl$path';
  }




