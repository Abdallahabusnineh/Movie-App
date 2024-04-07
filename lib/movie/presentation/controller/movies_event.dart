import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  MoviesEvent();

  @override
  List<Object> get props =>[];
}
class GetNowPlayingMoviesEvent extends MoviesEvent{

}
class GetPobularMoviesEvent extends MoviesEvent{

}
class GetTopRatedMoviesEvent extends MoviesEvent{

}
