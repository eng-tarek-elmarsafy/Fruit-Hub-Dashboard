import 'dart:developer';

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Bloc Event: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('Bloc Change: ${bloc.runtimeType}, Change: $change');
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   log('Bloc Transition: ${bloc.runtimeType}, Transition: $transition');
  // }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   log('Bloc Error: ${bloc.runtimeType}, Error: $error');
  //   super.onError(bloc, error, stackTrace);
  // }
}
