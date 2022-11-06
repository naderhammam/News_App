abstract class StatesCubit {}

class InitialCubit extends StatesCubit {}

class ChangeIndexCubit extends StatesCubit {}

class LoadingBusinessCubitCircle extends StatesCubit {}

class GetBusinessCubitData extends StatesCubit {}

class GetErrorBusinessCubitData extends StatesCubit {
  final String error;

  GetErrorBusinessCubitData(this.error);
}

class LoadingSportCubitCircle extends StatesCubit {}

class GetSportCubitData extends StatesCubit {}

class ModeCubitData extends StatesCubit {}

class GetErrorSportCubitData extends StatesCubit {
  final String error;

  GetErrorSportCubitData(this.error);
}

class LoadingSearchCubitCircle extends StatesCubit {}

class GetSearchCubitData extends StatesCubit {}


class GetErrorSearchCubitData extends StatesCubit {
  final String error;

  GetErrorSearchCubitData(this.error);
}

class LoadingScienceCubitCircle extends StatesCubit {}

class GetScienceCubitData extends StatesCubit {}

class GetErrorScienceCubitData extends StatesCubit {
  final String error;

  GetErrorScienceCubitData(this.error);
}
