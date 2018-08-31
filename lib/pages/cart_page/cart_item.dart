import 'package:flutter/material.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plantly/redux/actions/RemoveItemAction.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';

class CartItem extends StatelessWidget {
  final PageViewModel plant;
  final int position;
  CartItem(this.plant,this.position){
    debugPrint(this.plant.title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        elevation: 30.0,
        shadowColor: Colors.black54,
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: ListTile(
            leading: Image.asset(plant.heroAssetPath),
            title: Text(plant.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0)),
            subtitle: Material(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: Text(
                    plant.price - plant.price.truncate() > 0
                        ? '\$${plant.price.toStringAsFixed(2)}'
                        : '\$${plant.price.truncate()}',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            trailing: StoreConnector<AppState,OnItemAddedCallback>(
                converter: (store){

                  return (singleProData) =>

                      store.dispatch(

                          RemoveItemAction(this.position)

                      );
                },
                builder:(context,callback){

                  return IconButton(
                    onPressed: () {
                      callback(this.plant);

                    },
                    icon: Icon(Icons.delete, color: Colors.black26),
                  );
                }

            )
          ),
        ),
      ),
    );
  }
}
typedef OnItemAddedCallback = Function(PageViewModel data);
