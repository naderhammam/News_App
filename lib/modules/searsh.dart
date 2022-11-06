import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';

import '../component/component.dart';
import '../cubit/states.dart';
var searchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, StatesCubit>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'not must be empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(

                    label: Text('Search'),
                    // hintStyle: TextStyle(color: Colors.black),

                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        stateNewsItem(list[index], context),
                    separatorBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(18),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[400],
                    ),
                    itemCount: list.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
