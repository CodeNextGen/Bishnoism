
import 'package:flutter/material.dart';

import 'plant_preview.dart';
import 'package:plantly/pages/cart_page/cart_page.dart';
import 'package:plantly/classes/plants_list.dart';
import 'package:plantly/classes/cart.dart';
import 'package:plantly/theme/custom_colors.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:plantly/redux/actions/AddItemAction.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';

class SingleProduct extends StatefulWidget {

  PageViewModel singleProData;

  SingleProduct(this.singleProData);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Color> boughtBgColorAnimation;
  Animation<Color> boughtIconColorAnimation;

  bool showBoughtOverlay = false;
  int actualPlant = 0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animationController.addListener(() => setState(() {}));

    boughtBgColorAnimation =
        ColorTween(begin: Colors.transparent, end: Color(0xF04CAF50)).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.decelerate));

    boughtIconColorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.white).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint('cart-${widget.singleProData.id}');
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            /// Plants list, buttons and buy button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /// Plants PageView
//                Expanded(
//                  child: PageView.builder(
//                    scrollDirection: Axis.horizontal,
//                    itemCount: plantsList.length,
//                    itemBuilder: (_, int pos) => PlantPreview(plantsList[pos]),
//                    onPageChanged: (int PlantPos) => actualPlant = PlantPos,
//                  ),
//                ),

                Expanded(
                  child:  PlantPreview(widget.singleProData)
                ),

                /// Like and share buttons
                Container(
                  margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.favorite_border,
                                    color: Colors.green),
                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                Text('426',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Share',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                Icon(Icons.share, color: Colors.green),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Buy button
                Container(
//                  tag: 'Buy button',
                  child:StoreConnector<AppState,OnItemAddedCallback>(
                  converter: (store){
                    return (singleProData) =>
                        store.dispatch(
                        AddItemAction(singleProData)
                    );
                  },
                      builder:(context,callback){

                        return  MaterialButton(
                          onPressed: () => callback(widget.singleProData),

                          color: nike_girl,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text('Add to cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                        );
                      }

                  )
                ),
              ],
            ),

            /// When a plant is bought
            showBoughtOverlay
                ? SizedBox.expand(
              child: Container(
                color: boughtBgColorAnimation.value,
                child: Center(
                    child: Icon(Icons.done,
                        size: 128.0,
                        color: boughtIconColorAnimation.value)),
              ),
            )
                : Container()
          ],
        ),

    );
  }

  void buyPlant() {
    setState(() {
      showBoughtOverlay = true;
      Cart.cartItems.add(actualPlant);
      animationController.forward().then((_) => animationController
          .reverse()
          .then((_) => setState(() => showBoughtOverlay = false)));
    });
  }
}
typedef OnItemAddedCallback = Function(PageViewModel data);
