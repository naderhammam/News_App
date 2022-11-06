import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/network/local/cache_helper.dart';

import 'component/blocops.dart';
import 'cubit/states.dart';
import 'layout/news_layout.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(isDark!));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..changeMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, StatesCubit>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 20,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                // unselectedItemColor: Colors.black45,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 18,
                actionsIconTheme:
                    IconThemeData(color: Colors.black, opacity: 100, size: 25),
                titleTextStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.white,
                elevation: 0,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('121212'),
                elevation: 20,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                // unselectedItemColor: Colors.black45,
              ),
              scaffoldBackgroundColor: HexColor('121212'),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 18,
                actionsIconTheme: const IconThemeData(
                    color: Colors.white, opacity: 100, size: 25),
                titleTextStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('121212'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('121212'),
                elevation: 0,
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
