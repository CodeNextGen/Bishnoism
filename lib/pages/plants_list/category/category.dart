import 'package:flutter/material.dart';
import 'category_item.dart';
import 'category_model.dart';
final catArray=[
  CategoryModel('1','Men','res/plant1.png','100'),
  CategoryModel('2','Women','res/plant1.png','250'),
  CategoryModel('3','Kids','res/plant1.png','125'),
  CategoryModel('4','Kids','res/plant1.png','125'),
  CategoryModel('5','Men','res/plant1.png','100'),
  CategoryModel('6','Women','res/plant1.png','250'),
  CategoryModel('7','Kids','res/plant1.png','125'),
  CategoryModel('8','Kids','res/plant1.png','125'),
];

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => new _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
      return new Padding(
        padding: EdgeInsets.all(8.0),
      child: new ListView(
        children: catArray.map((CategoryModel pagedata) => CategoryItem(pagedata)
        ).toList(),
      ),
    );
  }
}

