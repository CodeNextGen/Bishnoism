import 'package:plantly/redux/reducers/app/app_state.dart';
import 'package:plantly/redux/reducers/cart/cartReducer.dart';
import 'package:plantly/redux/reducers/products/productsReducer.dart';
AppState appReducer(AppState state, dynamic action) {
  //print(state.products);
  return new AppState(
    cartItems: cartItemsReducer(state.cartItems, action),
    products: productsReducer(state.products,action)
  );
}
