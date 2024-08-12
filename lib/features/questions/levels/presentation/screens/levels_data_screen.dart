import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/levels_repo_implement.dart';
import '../controllers/levels_cubit.dart';
import '../controllers/levels_state.dart';


class LevelsData extends StatelessWidget {
  const LevelsData({super.key});

  @override
  Widget build(BuildContext context) {
    LevelsCubit cubit = LevelsCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LevelsCubit, LevelsState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Text(
                          '${cubit.levelsData![i].name}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cubit.levelsData?.length ?? 0,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () async {

                    await cubit.getAllItems(LevelsRepoImple());
                  //}
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
