import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/subjects_model.dart';




abstract class  SubjectsRepo{
  Future<Either<Failure,List< SubjectsModel>>> getSubjects();
}