import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'res/plant1.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'res/plant1.png'
  ),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'res/plant1.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'res/plant1.png'
  ),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'res/plant1.png',
    'Store',
    'All local stores are categorized for your convenience',
    'res/plant1.png',
  ),
];

class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.INFINITY,
        color: viewModel.color,
        height: 200.00,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 5.0),
                    child: new Image.asset(
                        viewModel.heroAssetPath,
                        width: 100.0,
                        height: 100.0
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      viewModel.title,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRoma',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
//                new Transform(
//                  transform: new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
//                  child: new Padding(
//                    padding: new EdgeInsets.only(bottom: 15.0),
//                    child: new Text(
//                      viewModel.body,
//                      textAlign: TextAlign.center,
//                      style: new TextStyle(
//                        color: Colors.white,
//                        fontSize: 18.0,
//                      ),
//                    ),
//                  ),
//                ),
              ]
          ),
        )
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}