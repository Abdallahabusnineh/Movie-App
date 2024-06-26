import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/network/ApiConstance.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

class PobularComponent extends StatelessWidget {
  const PobularComponent({super.key});

  @override
  Widget build(BuildContext context){
    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous,current)=>
        previous.pobularState!=current.pobularState,
      builder: (context,state){

switch(state.pobularState){

  case RequsetState.loading:
    // TODO: Handle this case.
    return Container(
        height: 170,
        child: Center(child: CircularProgressIndicator(),));
  case RequsetState.loaded:
    // TODO: Handle this case.
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(

          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: state.pobularMovies.length,
          itemBuilder: (context, index) {
            final movie = state.pobularMovies[index];
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  /// TODO : NAVIGATE TO  MOVIE DETAILS
                },
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                    width: 120.0,
                    fit: BoxFit.cover,
                    imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  case RequsetState.error:
    // TODO: Handle this case.
    return SizedBox(
        height: 400,
        child: Center(child: Text(state.pobularMessage)));
}
        //log(state.toString());

      },
    );
  }
}
