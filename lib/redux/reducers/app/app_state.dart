import 'package:plantly/redux/models/page_view_model.dart';
import 'package:plantly/redux/models/products.dart';
import 'package:meta/meta.dart';
@immutable
class AppState{

  final List<PageViewModel> cartItems;
  final Products products;
  AppState({
    @required this.cartItems,
    @required this.products,

  });

  factory AppState.initial() {
    return new AppState(
      cartItems: [],
      products: null
    );
  }

  AppState copyWith({
    List<PageViewModel> cartItems,
    Products products
  }) {
    return new AppState(
      cartItems: cartItems ?? this.cartItems,
      products:products?? this.products
    );
  }

}