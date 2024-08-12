import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task2intern/features/questions/subjects/data/repos/subjects_repo.dart';
import '../../../../../core/data_source/end_points.dart';
import '../../../../../core/data_source/remote/dio_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../models/subjects_model.dart';




class  SubjectsRepoImple implements  SubjectsRepo {
  @override
  Future<Either<Failure, List< SubjectsModel>>> getSubjects() async {
    try {
      Response response = await DioHelper.get(endPoint: SUBJECT_URL);
      if (response.statusCode == 200) {
        return right( SubjectsModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
