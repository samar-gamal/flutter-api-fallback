import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import 'products_repo.dart';

import '../../../../core/data_source/remote/dio_helper.dart';
import '../models/products_model.dart';

class PrimProductsRepoImple implements ProductsRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      Response response = await DioHelper.get(endPoint: 'pro');
      if (response.statusCode == 200) {
        return right(ProductModel.formListOfJson(response.data));
      } else {
        return left(ServerFailure.fromResponse(response.data));
      }
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
