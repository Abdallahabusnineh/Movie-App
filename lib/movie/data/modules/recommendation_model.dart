import 'package:moviesapp/movie/domain/entites/recomindation.dart';

class RecommendationModel extends Recommendation {
  RecommendationModel({required super.id,super.backdropPath});


  factory RecommendationModel.fromJson(Map<String,dynamic>json)=>RecommendationModel(
  id:json['id'],
  backdropPath:json['backdrop_path']??'/fOG2oY4m1YuYTQh4bMqqZkmgOAI.png',
  );

}

