part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState(
      {this.movieDetail,
      this.movieDetailtState = RequsetState.loading,
      this.movieDetailsMessage = '',
      this.recommendation = const [],
      this.recommendationMessage = '',
      this.recommendationState = RequsetState.loading});

  @override
  final MovieDetail? movieDetail;
  final RequsetState movieDetailtState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequsetState recommendationState;
  final String recommendationMessage;

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequsetState? movieDetailtState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequsetState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailtState: movieDetailtState ?? this.movieDetailtState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendation: recommendation ?? this.recommendation,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
        recommendationState: recommendationState ?? this.recommendationState);
  }

  // TODO: implement props
  List<Object?> get props => [
        movieDetail,
        movieDetailtState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage
      ];
}
