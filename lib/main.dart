import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/questions/levels/presentation/controllers/levels_cubit.dart';
import 'features/questions/subjects/presentation/controllers/subjects_cubit.dart';
import 'features/questions/systems/presentation/controllers/systems_cubit.dart';
import 'features/questions/topics/presentation/controllers/topics_cubit.dart';
import 'core/data_source/local/cache_manager.dart';
import 'core/data_source/remote/dio_helper.dart';
import 'features/questions/Languages/presentation/controllers/Language_cubit.dart';
import 'features/questions/specificities/presentation/controllers/specificities_cubit.dart';
import 'features/questions/years/presentation/controllers/years_cubit.dart';
import 'features/questions/years/presentation/screens/years_data_screen.dart';

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
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => SpecificitiesCubit()),
        BlocProvider(create: (context) => LevelsCubit()),
        BlocProvider(create: (context) => SystemsCubit()),
        BlocProvider(create: (context) => SubjectsCubit()),
        BlocProvider(create: (context) => TopicsCubit()),
        BlocProvider(create: (context) => YearsCubit()),
      ],
      child: const MaterialApp(
        home: YearsData(),
      ),
    );
  }
}

