import 'package:flutter/material.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import '../fullscreen_image_page.dart';
import 'package:plantly/theme/custom_colors.dart';

class PlantPreview extends StatelessWidget {
  final PageViewModel plant;
  PlantPreview(this.plant);

  final LinearGradient backgroundGradient = LinearGradient(colors: [
    Color(0x10000000), // Light black
    Color(0x30000000), // Dark black
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 24.0, left: 24.0, right: 24.0, bottom: 0.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FullscreenImagePage(plant.heroAssetPath))),
        child: Material(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: Container(
                  decoration: BoxDecoration(color:Colors.white),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Hero(
                      tag: 'pro-${this.plant.id}',
                      child: new FadeInImage.assetNetwork(
                      fit: BoxFit.cover,

                      placeholder: "res/plant1.png",
                      image:
                      this.plant.heroAssetPath))
              )
              ,
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Material(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(14.0)),
                    color: Colors.black,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      child: Text(plant.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700)),
                    ),
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(14.0)),
                    color: nike_girl,
                    child: Container(
                      margin: EdgeInsets.all(12.0),
                      child: Text(
                          plant.price - plant.price.truncate() > 0
                              ? '\$${plant.price.toStringAsFixed(2)}'
                              : '\$${plant.price.truncate()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
