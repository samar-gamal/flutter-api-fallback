import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/products/data/models/products_model.dart';
import 'package:task1intern/features/products/data/repos/products_repo.dart';
import 'package:task1intern/features/products/presentation/controllers/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductModel>? productData;
  Future<bool> getAllItems(ProductsRepo pro) async {
    emit(ProductLoading());
    final api = await pro.getProducts();

    final bool state = api.fold((l) {
      emit(ProductError());
      return false;
    }, (r) {
      productData = r;
      emit(ProductSuccess());
      return true;
    });
    return state;
  }
}
