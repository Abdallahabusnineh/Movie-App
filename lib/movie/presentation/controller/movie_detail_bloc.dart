import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/domain/entites/movie_detail.dart';
import 'package:moviesapp/movie/domain/entites/recomindation.dart';
import 'package:moviesapp/movie/domain/usecases/get_movie_detail_usecases.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';


part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendationMovie);
  }

  final GetMovieDetailsUseCases getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  Future<FutureOr<void>> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameter(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailtState: RequsetState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, movieDetailtState: RequsetState.loaded)));
  }

  Future<FutureOr<void>> _getRecommendationMovie(GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {

    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationState: RequsetState.error,
            recommendationMessage: l.message)),
            (r) => emit(state.copyWith(
            recommendation: r, recommendationState: RequsetState.loaded)));

  }
}
