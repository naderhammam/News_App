import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import '../cubit/states.dart';
import '../modules/searsh.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  //changeIndex
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, StatesCubit>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen() )) ;
                }, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                       NewsCubit.get(context).changeMode();

                    },
                    icon: const Icon(Icons.brightness_6_outlined)),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: cubit.items,
            ));
      },
      listener: (context, state) {},
    );
  }
}
