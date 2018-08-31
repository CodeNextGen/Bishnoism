import 'package:flutter/material.dart';
import 'package:plantly/redux/models/page_view_model.dart';
class RemoveItemAction {
   int posi;
   RemoveItemAction(int posi){
    this.posi=posi;
    print(this.posi.toString());
  }

}