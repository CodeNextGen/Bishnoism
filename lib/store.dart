import 'dart:async';
import 'package:redux/redux.dart';
import 'package:plantly/redux/reducers/app/app_reducer.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';
import 'package:plantly/middleware/logging.dart';
import 'package:plantly/middleware/products.dart';

Future<Store<AppState>> createStore() async {
  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      LoggingMiddleware(),
      ProductsMiddleWare()
    ],
  );
}