import 'package:flutter/material.dart';
import 'package:plantly/pages/plants_list/hr_scrollview.dart';
import 'package:plantly/pages/plants_list/section_header.dart';
import 'package:plantly/pages/plants_list/product_slider.dart';
import 'package:plantly/redux/models/page_view_model.dart';

final pages= [
  new PageViewModel(
  1,
    '0xFF678FB4',
    'res/plant1.png',
    'Sandal',
    '5',
    20
  ),
  new PageViewModel(
    2,
    '0xFF65B0B4',
    'res/plant1.png',
    'Sandal',
    '5',
    40
  ),
  new PageViewModel(
    3,
    '0xFF9B90BC',
    'res/plant1.png',
    'Sandal',
    '4',
    100

  ),
];

final pages2= [
  new PageViewModel(
    4,
    '0xFF678FB4',
    'res/plant1.png',
    'Sandal',
    '5',
    80
  ),
  new PageViewModel(
    5,
    '0xFF65B0B4',
    'res/plant1.png',
    'Sandal',
    '5',
    120
  ),
  new PageViewModel(
    6,
    '0xFF9B90BC',
    'res/plant1.png',
    'Sandal',
    '4',
    150
  ),
];


final pages3= [
  new PageViewModel(
    7,
    '0xFF678FB4',
    'res/plant1.png',
    'Sandal',
    '5',
    130
  ),
  new PageViewModel(
    8,
    '0xFF65B0B4',
    'res/plant1.png',
    'Sandal',
    '5',
    110
  ),
  new PageViewModel(
    9,
   '0xFF9B90BC',
    'res/plant1.png',
    'Sandal',
    '4',
    140
  ),
];
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProductSlider(),
        SectionHeader('New Arrivals', 'View All', this.onItemClick),
        HRScrollView(pages),
//        SectionHeader('Most Rated', 'View All', this.onItemClick),
//        HRScrollView(pages2),
//        SectionHeader('Categories', 'View All', this.onItemClick),
//        HRScrollView(pages3),
      ],
    );
    ;
  }

  onItemClick(String text) {
    debugPrint(text);
  }
}


