import 'package:flutter/material.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'single_product.dart';
import '../cart_page/cart_page.dart';
class CardItem extends StatelessWidget {
  PageViewModel pageViewModel;
  CardItem(PageViewModel pageViewModel){
    this.pageViewModel=pageViewModel;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
    onTap: ()=> Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (_) => SingleProduct(this.pageViewModel))),
   child: Hero(
        tag: 'pro-${this.pageViewModel.id}',
        child:Container(
        height: 150.00,
        width: 150.00,
        child: Card(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(8.00),

                      child: new FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          height: 135.00,
                          placeholder: "res/plant1.png",
                          image:
                          this.pageViewModel.heroAssetPath),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(2.00),
                      child: new Text(this.pageViewModel.title,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(2.00),
                      child: new Text(
                        '200 INR',
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: new Radius.circular(6.0)),
                      color: Colors.green,
                      child: Container(
                        margin: new EdgeInsets.all(3.0),
                        child: new Text('25% Off',style: TextStyle(color: Colors.white



                        ),),
                      ),
                    )),
              ],
            ))
    )
    )
    );
  }
}
