import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entites/recomindation.dart';
import 'package:moviesapp/movie/domain/repository/base_movie_repository.dart';
import 'package:moviesapp/movie/domain/usecases/get_recommendation%20_usecase.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{
  @override
 final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
  return await baseMoviesRepository.getRecommendation(parameters);
  }
}


/*
class RecommendationParameters extends Equatable{
 final int id;

  RecommendationParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
*/
