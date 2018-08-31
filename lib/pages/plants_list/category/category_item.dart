import 'package:flutter/material.dart';
import 'category_model.dart';
import '../../../theme/custom_colors.dart';
class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryItem(categoryModel){
    this.categoryModel=categoryModel;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.white ,
      child: ListTile(
        leading: ImageIcon(new AssetImage(this.categoryModel.catCover),color: Colors.pinkAccent,),
        title:Text(this.categoryModel.catName,style: TextStyle(fontWeight: FontWeight.w700),),
        trailing: Text(this.categoryModel.itemCount+' items'),
      )
    );
  }
}
