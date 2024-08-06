import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/data_source/local/cache_manager.dart';

import 'package:task1intern/features/products/presentation/controllers/product_cubit.dart';
import 'package:task1intern/features/products/presentation/screens/show_data_screen.dart';
import 'core/data_source/remote/dio_helper.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => ProductCubit()),
    ],
      child: const MaterialApp(
        home: ShowData(),
      ),
    );
  }
}

