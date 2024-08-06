import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/products_model.dart';

abstract class ProductsRepo{
  Future<Either<Failure,List<ProductModel>>> getProducts();
}