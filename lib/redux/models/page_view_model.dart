import 'package:flutter/material.dart';
class PageViewModel {
   int id;
   String color;
   String heroAssetPath;
   String title;
   String body;
   int price;
   PageViewModel(this.id,this.color, this.heroAssetPath, this.title, this.body,this.price);




  PageViewModel.fromMap(Map<String, dynamic>  obj) {
    this.id = obj["id"];
    this.color = obj["color"];
    this.heroAssetPath=obj["heroAssetPath"];
    this.title=obj['title'];
    this.body=obj['body'];
    this.price=obj['price'];
  }

}