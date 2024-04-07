import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/network/ApiConstance.dart';
import 'package:moviesapp/core/services/services_locater.dart';
import 'package:moviesapp/core/utils/app_string.dart';
import 'package:moviesapp/movie/presentation/component/now_playing_component.dart';
import 'package:moviesapp/movie/presentation/component/pobular_component.dart';
import 'package:moviesapp/movie/presentation/component/top_rated_component.dart';
import 'package:moviesapp/movie/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/movies_event.dart';
import 'package:moviesapp/movie/presentation/controller/movies_state.dart';

import 'package:shimmer/shimmer.dart';

// shimmer it is a pakage provides screen for loading
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>sl<MoviesBloc>()
        ..add(GetPobularMoviesEvent())
        ..add(GetNowPlayingMoviesEvent())
      ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc,MoviesState>(
        builder: (context,state){
         // print("bloc of m s");
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NowPlayingComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.popular,
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                              color: Colors.white
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO POPULAR SCREEN
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  AppString.seemore,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PobularComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      16.0,
                      24.0,
                      16.0,
                      8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.toprated,

                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                              color: Colors.white
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            /// TODO : NAVIGATION TO Top Rated Movies Screen
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(AppString.seemore,style: TextStyle(color: Colors.white),),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TopRatedComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
