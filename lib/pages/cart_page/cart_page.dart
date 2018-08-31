import 'package:flutter/material.dart';
import '../../classes/cart.dart';

import 'cart_item.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, list) {
          return cartBuilder(list.cartItems);
        },
      ),
    );
  }

  double calculateFinalPrice(list) {
    double cost = 0.0;
    int list_length=list.length;
    for (int i=0;i<list_length;i++) {
      //debugPrint(i.toString());
      cost += list[i].price;
    }
    return cost;
  }

  Widget cartBuilder(list) {
    print(list);
    if (list.length > 0) {
      return Material(
        borderRadius: BorderRadius.circular(8.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: Text('Shopping cart',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 26.0)),
            actions: <Widget>[
              Center(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, color: Colors.black45),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, int pos) =>
                CartItem(list[pos],pos),
          ),
          bottomNavigationBar: Hero(
            tag: 'Buy button',
            child: MaterialButton(
              onPressed: () {},
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                    'Buy Now (\$${calculateFinalPrice(list).toStringAsFixed(2)})',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      );
    } else // Show an empty state
    {
      return Material(
        borderRadius: BorderRadius.circular(8.0),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              title: Text('Shopping cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0)),
              actions: <Widget>[
                Center(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: Colors.black45),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.remove_shopping_cart,
                      color: Colors.black26, size: 96.0),
                  Padding(padding: EdgeInsets.only(bottom: 48.0)),
                  Text('Your cart is empty!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.0)),
                  Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 64.0),
                    child: Text(
                        'Looks like you haven\'t added any plants to your cart yet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0)),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 96.0)),
                  Container(
                    child: Material(
                      elevation: 16.0,
                      shadowColor: Color(0x7000E676),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 64.0, vertical: 16.0),
                          child: Text('Go back',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    }



  }


}
