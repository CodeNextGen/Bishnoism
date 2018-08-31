import 'package:flutter/material.dart';
import 'package:plantly/redux/models/page_view_model.dart';
class AddItemAction {
   PageViewModel item;
  AddItemAction(item){
    debugPrint(item.toString());
    this.item=item;
    print(this.item.title.toString());
  }

}