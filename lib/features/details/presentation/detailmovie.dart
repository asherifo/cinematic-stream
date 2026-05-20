import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilix/features/details/logic/detail_cubit.dart';
import 'package:netfilix/features/details/logic/detail_state.dart';
import 'package:netfilix/features/home/data/movie_model.dart';

// ignore: must_be_immutable
class Detailmovie extends StatelessWidget {
  const Detailmovie({super.key});

  @override
  Widget build(BuildContext context) {
    final currentMovie = ModalRoute.of(context)!.settings.arguments as Results;
    return BlocProvider(
      create: (context) => DetailCubit()..getDetailsMovie(),
      child: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state is DetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            );
          } else if (state is DetailSuccessState) {
            final movie = state.movieDetailModel;
            return Scaffold(
              backgroundColor: Colors.black,

              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${currentMovie.backdropPath!}",
                        fit: BoxFit.fill,
                        height: 222,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, left: 10),
                      child: Text(
                        currentMovie.originalTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1, left: 8),
                      child: Row(
                        children: [
                          Text(
                            currentMovie.releaseDate!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                          Image.asset('assets/icons/ratingIcon.png'),
                          Text(
                            ' ${currentMovie.voteAverage!} ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                          Image.asset('assets/icons/hdIcon.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Text(
                        currentMovie.overview!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight(400),

                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Cast: Tovino Thomas, Siddique, Vineeth Thattil David... more',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontSize: 11,
                          fontWeight: FontWeight(400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Creator: Darwin Kuriakose',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          fontSize: 11,
                          fontWeight: FontWeight(400),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              Text(
                                'My List',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 48.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Rate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 48),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        height: 30,
                        width: 110,
                        child: Divider(color: Colors.red, thickness: 4),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        ' More Like This',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight(500),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,

                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: movie.results!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detailMovie',
                                arguments: movie.results![index],
                              );
                            },
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.results![index].posterPath}",
                              height: 180,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startTop,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/HomePage',
                    (route) => false,
                  );
                },
                child: Icon(Icons.chevron_left, color: Colors.white, size: 27),
              ),
            );
          } else if (state is DetailErrorState) {
            return Center(
              child: Text(
                state.errorDetail,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
