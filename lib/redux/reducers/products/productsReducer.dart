import 'package:plantly/redux/models/products.dart';
import 'package:plantly/redux/actions/DisplayProducts.dart';


Products productsReducer(Products items, dynamic action){

 // print("in product reducer $action");

  if(action is DisplayProducts){
    return action.products;
  }
  return items;
}