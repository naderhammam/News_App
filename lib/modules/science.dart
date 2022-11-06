import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, StatesCubit>(
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).science ;
        return ConditionalBuilder(
            condition:  list.isNotEmpty,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => stateNewsItem(list[index],context),
              separatorBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(18),
                height: 1,
                width: double.infinity,
                color: Colors.grey[400],
              ),
              itemCount:  list.length,
            ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
