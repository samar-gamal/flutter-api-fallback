import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/years_repo_implement.dart';
import '../controllers/years_cubit.dart';
import '../controllers/years_state.dart';



class YearsData extends StatelessWidget {
  const YearsData({super.key});

  @override
  Widget build(BuildContext context) {
    YearsCubit cubit = YearsCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<YearsCubit, YearsState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Text(
                          '${cubit.yearsData![i].year}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cubit.yearsData?.length ?? 0,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () async {

                    await cubit.getAllItems(YearsRepoImple());
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
