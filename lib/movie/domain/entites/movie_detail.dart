import 'package:equatable/equatable.dart';
import 'package:moviesapp/movie/domain/entites/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  // final List<int>genres;//this is list of object so we declare it in external file
  final List<Genres>genres;

  const MovieDetail({required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        backdropPath,
        id,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
        genres
      ];
}