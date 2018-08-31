import 'dart:async';
import 'package:redux/redux.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';
import 'package:plantly/redux/actions/FetchProducts.dart';
import 'package:plantly/network/rest_ds.dart';
import 'package:plantly/pages/auth/login/user.dart';
import 'package:plantly/redux/models/products.dart';
import 'package:plantly/redux/actions/DisplayProducts.dart';
class ProductsMiddleWare extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next)  async{
    //next(action);
    //print("Dispatching in products $action");
    if(action is FetchProducts){
       Products userData = await RestDatasource().getProducts(1,10);
       print("comes here");
       store.dispatch(DisplayProducts(false,userData));
    }
    next(action);
  }
}