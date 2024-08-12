import 'package:dartz/dartz.dart';


import '../../../../../core/errors/failure.dart';
import '../models/levels_model.dart';



abstract class LevelsRepo{
  Future<Either<Failure,List<LevelsModel>>> getLevels();
}