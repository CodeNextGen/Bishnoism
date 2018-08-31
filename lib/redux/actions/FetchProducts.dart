import 'package:plantly/redux/models/products.dart';

class FetchProducts{
  bool isLoading;
  Products products;
  FetchProducts(this.isLoading,this.products);
}