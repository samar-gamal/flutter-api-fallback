import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/specificities_model.dart';
import 'specificities_repo.dart';





class SpecificitiesRepoImple implements SpecificitiesRepo {
  @override
  Future<Either<Failure, List<SpecificitiesModel>>> getSpecificities() async {
    try {
      Response response = await DioHelper.get(endPoint: SPECI_URL);
      if (response.statusCode == 200) {
        return right(SpecificitiesModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
