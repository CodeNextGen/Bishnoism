import 'package:flutter/material.dart';
import '../section_header.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => new _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          color: Colors.blueGrey,
          child: Container(
            height: 200.00,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(backgroundColor: Colors.pinkAccent,radius: 50.00,backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLSIlQEYkFXvxGFi7ykGKqFuVqlNdUQ1hylc-PoVuJkq7dl608') ),
                  Padding(
                    padding:EdgeInsets.all(4.00),
                      child:Text('Sanjeev Kumar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding:EdgeInsets.all(4.00),
                    child:Text('9780377429',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),

                  ),

                ],
              ),

            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.00),
          child: Card(
            child: Column(
              children: <Widget>[
                SectionHeader('My Orders', '', this.onItemClick,color: Colors.white),
                Divider(),
                SectionHeader('My Wishlist', '', this.onItemClick,color: Colors.white),
                Divider(),
                SectionHeader('My Reviews', '', this.onItemClick,color: Colors.white),
                Divider(),
                SectionHeader('My Addresses', '', this.onItemClick,color: Colors.white)
              ],
            ),
          ),
        ),
        ListTile(leading: Icon(Icons.message), title: Text('My Notifications')),
        Divider(),
        ListTile(leading: Icon(Icons.message), title: Text('My Notifications')),
        Divider(),
        ListTile(leading: Icon(Icons.message), title: Text('My Notifications')),
        Divider(),
        ListTile(leading: Icon(Icons.message), title: Text('My Notifications')),
        Divider(),
        ListTile(leading: Icon(Icons.message), title: Text('My Notifications')),

      ],
    );
  }

  onItemClick(item) {}
}
