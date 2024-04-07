import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/services/services_locater.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/data/datasource/movie_remote_datasource.dart';
import 'package:moviesapp/movie/data/repository/movies_repository.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';
import 'package:moviesapp/movie/domain/usecases/get_nowplaying_movies_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_popular_movies_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_toprated_movies_usecases.dart';
import 'package:moviesapp/movie/presentation/controller/movies_event.dart';
import 'package:moviesapp/movie/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    //بضيف event  ل bloc عن طريق اضافة ميثود on
    //<GetNowPlayingMoviesEvent> هيك بحدللها الايفينت اللي بدي اضيفها هون

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPobularMoviesEvent>(_getPobularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    //emit هي اللي بغير ال state عن طريقها
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
          nowPlayingState: RequsetState.error, nowPlayingMessage: l.message));
    }, (r) {
emit(
    state.copyWith(nowPlayingMovies: r, nowPlayingState: RequsetState.loaded)

);
    });
  }

  FutureOr<void> _getPobularMovies(
      GetPobularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        pobularState: RequsetState.error,
        pobularMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(pobularMovies: r, pobularState: RequsetState.loaded));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
          topRatedMessage: l.message, topRatedState: RequsetState.error));
    }, (r) {
      emit(state.copyWith(
          topRatedMovies: r, topRatedState: RequsetState.loaded));
    });
  }
}
