import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/products/data/repos/prim_products_repo_implement.dart';
import 'package:task1intern/features/products/data/repos/sec_products_repo_implement.dart';
import 'package:task1intern/features/products/presentation/controllers/product_cubit.dart';
import 'package:task1intern/features/products/presentation/controllers/product_state.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Text(
                          '${cubit.productData![i].title}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cubit.productData?.length ?? 0,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () async {
                  final bool state = await cubit.getAllItems(PrimProductsRepoImple());
                  if (!state) {
                    await cubit.getAllItems(SecProductsRepoImple());
                  }
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }

}
