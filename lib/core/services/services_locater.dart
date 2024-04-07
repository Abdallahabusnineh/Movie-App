import 'package:get_it/get_it.dart';
import 'package:moviesapp/movie/data/datasource/movie_remote_datasource.dart';
import 'package:moviesapp/movie/data/repository/movies_repository.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';
import 'package:moviesapp/movie/domain/usecases/get_movie_detail_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_nowplaying_movies_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_popular_movies_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';
import 'package:moviesapp/movie/domain/usecases/get_toprated_movies_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/login_usecase.dart';
import 'package:moviesapp/movie/domain/usecases/register_usecase.dart';
import 'package:moviesapp/movie/presentation/controller/login_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/movie_detail_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/register_bloc.dart';
//بحطها برا الكلاس عشان استخدمها بالمكان اللي ببدي اياه
final sl = GetIt.instance;
class ServicesLocater{
  void init(){
    // bloc register
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));//انت كل ما تنادي على موفي بلوك انا رح اعملك كريات ل ابوجيكت جديد عكس ال singleto اللي بعمل كريات ل اوبجيكت مرة وحدة
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));//انت كل ما تنادي على موفي بلوك انا رح اعملك كريات ل ابوجيكت جديد عكس ال singleto اللي بعمل كريات ل اوبجيكت مرة وحدة
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    //**///
    // use cases
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailsUseCases(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    
    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));//sl() معناها انو انتا لما تنادي عل سيرفيس لوكيتر رح تلاقي الاوبجيكت فيها



    // data source
sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

  }
}