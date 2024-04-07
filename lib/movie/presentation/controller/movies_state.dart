import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/domain/entites/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequsetState nowPlayingState; //enum state
  final String nowPlayingMessage;

  final List<Movie> pobularMovies;
  final RequsetState pobularState; //enum state
  final String pobularMessage;
  final List<Movie> topRatedMovies;
  final RequsetState topRatedState; //enum state
  final String topRatedMessage;


  const MoviesState({
    this.pobularMovies=const[],
    this.pobularState=RequsetState.loading,
    this.pobularMessage='',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequsetState.loading,
    this.nowPlayingMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequsetState.loading,
    this.topRatedMessage = '',

  });
  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     RequsetState ?nowPlayingState,//enum state
     String ?nowPlayingMessage,
  List<Movie> ?pobularMovies,
  RequsetState ?pobularState, //enum state
   String ?pobularMessage,
    List<Movie> ?topRatedMovies,
    RequsetState ?topRatedState, //enum state
    String ?topRatedMessage,

  }){
    return MoviesState(
     nowPlayingMovies: nowPlayingMovies ??this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
    nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
      pobularMovies: pobularMovies??this.pobularMovies,
      pobularState: pobularState??this.pobularState,
      pobularMessage: pobularMessage??this.nowPlayingMessage,
        topRatedMovies: topRatedMovies??this.topRatedMovies,
        topRatedState: topRatedState??this.topRatedState,
        topRatedMessage: topRatedMessage??this.topRatedMessage

    );
}

  @override
  // TODO: implenowPlayinMent props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        pobularMovies,
        pobularMessage,
        pobularState,
    topRatedMovies,
    topRatedMessage,
    topRatedState,
      ];
}
