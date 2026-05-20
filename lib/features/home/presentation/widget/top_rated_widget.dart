import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilix/features/home/logic/cubit.dart';
import 'package:netfilix/features/home/logic/state.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 10),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Top Rated',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeSuccessState) {
                final moviesList = state.topRatedMovies.results!;
                return SizedBox(
                  height: 158,
                  child: ListView.builder(
                    itemCount: moviesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detailMovie',
                              arguments: moviesList[index],
                            );
                          },
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${state.topRatedMovies.results![index].posterPath!}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: Text(
                    state.errorMesage,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
