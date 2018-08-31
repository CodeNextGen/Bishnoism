import 'package:flutter/material.dart';

import 'package:plantly/pages/plants_list/plant_preview.dart';
import 'package:plantly/pages/cart_page/cart_page.dart';

import 'package:plantly/theme/custom_colors.dart';
import 'package:plantly/pages/plants_list/account/my_account.dart';
import 'package:plantly/pages/plants_list/home_screen.dart';
import 'category/category.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';

class PlantsListPage extends StatefulWidget {
  @override
  _PlantsListPageState createState() => _PlantsListPageState();
}

class _PlantsListPageState extends State<PlantsListPage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          backgroundColor: Colors.white,
          elevation: 1.0,
//          leading: IconButton(
//            onPressed: () => showAboutDialog(
//                context: context,
//                applicationIcon: Container(
//                    width: 60.0, child: Image.asset('res/app_icon.png')),
//                applicationLegalese:
//                    'A plant shop e-commerce app concept.\n\nMade by Ivascu Adrian (Skuu labs).'),
//            icon: Icon(Icons.menu, color: Colors.black),
//          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('.',
                  style: TextStyle(
                      color: nike_girl,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700)),
              Text('My',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  )),
              Text('Kart',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700)),
              Text('.',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700))
            ],
          ),
          actions: <Widget>[
            Center(
              child: IconButton(
                  onPressed: () => Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (_) => CartPage())),
                  icon: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.shopping_basket, color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: nike_girl,
                            child: StoreConnector<AppState,
                                AppState>(
                              converter: (store) => store.state,
                              builder: (context, list) {
                                return Text(list.cartItems.length.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0));
                              },
                            )),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        backgroundColor: whitesmoke,
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                  padding: const EdgeInsets.all(0.0),
                  child: new Container(
                    decoration: new BoxDecoration(
                        gradient: new LinearGradient(colors: [
                      const Color(0xff2b5876),
                      const Color(0xff4e4376),
                    ])),
                  )),
              new ListTile(
                title: new Text("Search"),
                trailing: new Icon(Icons.search),
                onTap: () => print('hello'),
              ),
              new Divider(
                height: 5.0,
              ),
              new ListTile(
                title: new Text("Movies"),
                selected: true,
                trailing: new Icon(Icons.local_movies),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              new ListTile(
                title: new Text("TV Shows"),
                selected: false,
                trailing: new Icon(Icons.live_tv),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              new Divider(
                height: 5.0,
              ),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body: new PageView(
          children: _getMediaList(),
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _page = index;
            });
          },
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _getNavBarItems(),
          onTap: _navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems() {
    return [
      new BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text('Home')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.list), title: new Text('Categories')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.supervised_user_circle),
          title: new Text('Profile')),
    ];
  }

  List<Widget> _getMediaList() {
    return <Widget>[HomeScreen(), Category(), MyAccount()];
  }

  void _navigationTapped(int page) {
    print('tab clicked' + page.toString());
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
