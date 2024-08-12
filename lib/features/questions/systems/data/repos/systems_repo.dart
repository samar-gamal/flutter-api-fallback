


import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../models/systems_model.dart';




abstract class SystemsRepo{
  Future<Either<Failure,List<SystemsModel>>> getSystems();
}