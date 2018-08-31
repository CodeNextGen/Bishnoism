import 'package:flutter/material.dart';
import 'package:plantly/pages/plants_list/home_screen.dart';
import 'package:plantly/pages/plants_list/card_item.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:plantly/redux/models/products.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HRScrollView extends StatefulWidget {
  List<PageViewModel> pages = [];
  HRScrollView(pages) {
    //this.pages=pages;
    //debugPrint(this.pages.length.toString());
  }

  @override
  _HRScrollViewState createState() => new _HRScrollViewState();
}

class _HRScrollViewState extends State<HRScrollView> {
  //List<PageViewModel> pages =widget.pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, list) {
          return cartBuilder(list.products);
        },
      ),
    );
  }

  cartBuilder(Products pages) {
    // print(pages);
    if (pages == null) {
      return new Container(
        height: 200.00,
        child: new Center(
          child: new Text(
            'No post found',
          ),
        ),
      );
    }else{

      print(pages.products.toString());
      return new Container(
      height:200.00,
      child:
    new ListView(
      scrollDirection: Axis.horizontal,
      children: pages.products.map((PageViewModel pagedata) => CardItem(pagedata)
      ).toList(),
    ),
    );

//      return new Container(
//        height: 200.00,
//        child: new Center(
//          child: new Text(
//            'not null',
//          ),
//        ),
//      );

    }


  }
}
