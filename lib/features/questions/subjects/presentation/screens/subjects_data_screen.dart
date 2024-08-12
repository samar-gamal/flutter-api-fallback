import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/subjects_state.dart';

import '../../data/repos/subjects_repo_implement.dart';
import '../controllers/subjects_cubit.dart';


class SubjectsData extends StatelessWidget {
  const SubjectsData({super.key});

  @override
  Widget build(BuildContext context) {
    SubjectsCubit cubit = SubjectsCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SubjectsCubit, SubjectsState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Text(
                          '${cubit.subjectsData![i].name}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cubit.subjectsData?.length ?? 0,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () async {

                    await cubit.getAllItems(SubjectsRepoImple());
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
