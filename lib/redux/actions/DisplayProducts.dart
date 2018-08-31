import 'package:plantly/redux/models/products.dart';

class DisplayProducts{
  bool isLoading;
  Products products;
  DisplayProducts(isLoading,products){
    this.isLoading=isLoading;
    this.products=products;
   // print('dispatched');
    //print(products.products);
  }
}