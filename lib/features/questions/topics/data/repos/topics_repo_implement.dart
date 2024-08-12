import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/topics_model.dart';
import 'topics_repo.dart';



class TopicsRepoImple implements TopicsRepo {
  @override
  Future<Either<Failure, List<TopicsModel>>> getTopics() async {
    try {
      Response response = await DioHelper.get(endPoint: TOPIC_URL);
      if (response.statusCode == 200) {
        return right(TopicsModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
