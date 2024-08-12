import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/specificities_repo_implement.dart';
import '../controllers/specificities_cubit.dart';
import '../controllers/specificities_state.dart';


class SpecificitiesData extends StatelessWidget {
  const SpecificitiesData({super.key});

  @override
  Widget build(BuildContext context) {
    SpecificitiesCubit cubit = SpecificitiesCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SpecificitiesCubit, SpecificitiesState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Text(
                          '${cubit.specificitiesData![i].name}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cubit.specificitiesData?.length ?? 0,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () async {

                    await cubit.getAllItems(SpecificitiesRepoImple());
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
