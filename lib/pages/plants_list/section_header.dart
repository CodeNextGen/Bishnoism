import 'package:flutter/material.dart';
import 'package:plantly/theme/custom_colors.dart';

class SectionHeader extends StatelessWidget {
  String title,viewall;
  Color color;
  Function onItemClick;

  SectionHeader(title,viewall,onItemClick,{color}){
    this.title=title;
    this.viewall=viewall;
    this.onItemClick=onItemClick;
    this.color=color;

  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(color:this.color==null?whitesmoke:this.color),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: new Text(
                this.title,
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            new Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>onItemClick('View all clicked'),
                    child: new Text(
                      this.viewall,
                      style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
