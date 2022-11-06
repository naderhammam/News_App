import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/busniess.dart';
import 'package:newsapp/modules/science.dart';
import 'package:newsapp/modules/settings.dart';
import 'package:newsapp/modules/sports.dart';
import 'package:newsapp/network/local/cache_helper.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<StatesCubit> {
  NewsCubit() : super(InitialCubit());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),

    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),

  ];
  void changeIndex(int index) {
    currentIndex = index;
    if (index==1 ){
      getSports();
    }
    if (index==2 ){
      getScience();
    }
    emit(ChangeIndexCubit());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  void getBusiness() {
    emit(LoadingBusinessCubitCircle());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '24c0c7c07fba4f0eb77d96aead9a1662',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(GetBusinessCubitData());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetErrorBusinessCubitData(error.toString()));
    });
  }
  void getSports() {
    emit(LoadingSportCubitCircle());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '24c0c7c07fba4f0eb77d96aead9a1662',
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(GetSportCubitData());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetErrorSportCubitData(error.toString()));
    });
  }
  void getScience() {
    emit(LoadingScienceCubitCircle());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '24c0c7c07fba4f0eb77d96aead9a1662',
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(GetScienceCubitData());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetErrorScienceCubitData(error.toString()));
    });
  }
  void getSearch(value) {
    emit(LoadingSearchCubitCircle());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',

      'apiKey': '24c0c7c07fba4f0eb77d96aead9a1662',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(GetSearchCubitData());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetErrorSearchCubitData(error.toString()));
    });
  }
 bool isDark = false ;

void changeMode ({bool? fromShared}){
    if(fromShared!=null){
      isDark=fromShared ;
      emit(ModeCubitData());

    }
    else{
      isDark = !isDark ;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ModeCubitData());
      });
    }



}
}
