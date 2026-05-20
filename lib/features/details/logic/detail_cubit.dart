import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilix/core/const/api_const.dart';

import 'package:netfilix/features/details/logic/detail_state.dart';
import 'package:netfilix/features/home/data/movie_model.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitialState());
  Dio dio = Dio();
  Future getDetailsMovie() async {
    emit(DetailLoadingState());
    try {
      final response = await dio.get(ApiConst.nowPlaying);
      final results = MovieModel.fromJson(response.data);

      emit(DetailSuccessState(movieDetailModel: results));
    } catch (e) {
      emit(DetailErrorState(errorDetail: e.toString()));
    }
  }
}
