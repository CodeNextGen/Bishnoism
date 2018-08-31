import 'package:redux/redux.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';

class LoggingMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    //var stateBefore = store.state.toString();
    //var products=store.state.products.toString();
    //print("Last store $stateBefore");
    //print("Dispatching $action");
    //print("Products before $products");
    next(action);
    //var stateAfter = store.state.toString();
    //print("Next store $stateAfter");
    //print("Products after $products");
  }

}