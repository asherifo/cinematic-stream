import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilix/core/const/api_const.dart';
import 'package:netfilix/features/home/data/movie_model.dart';
import 'package:netfilix/features/home/logic/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Dio dio = Dio();

  Future<void> fetchAllMovies() async {
    emit(HomeLoadingState());

    try {
      final responses = await Future.wait([
        dio.get(ApiConst.nowPlaying),
        dio.get(ApiConst.popular),
        dio.get(ApiConst.topRated),
      ]);

      final nowPlayingData = MovieModel.fromJson(responses[0].data);
      final popularData = MovieModel.fromJson(responses[1].data);
      final topRatedData = MovieModel.fromJson(responses[2].data);
      emit(
        HomeSuccessState(
          nowPlayingMovies: nowPlayingData,
          popularMovies: popularData,
          topRatedMovies: topRatedData,
        ),
      );
    } catch (e) {
      emit(HomeErrorState(errorMesage: e.toString()));
    }
  }
}
