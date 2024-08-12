import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/levels_model.dart';
import 'levels_repo.dart';



class LevelsRepoImple implements LevelsRepo {
  @override
  Future<Either<Failure, List<LevelsModel>>> getLevels() async {
    try {
      Response response = await DioHelper.get(endPoint: LEVEL_URL);
      if (response.statusCode == 200) {
        return right(LevelsModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
