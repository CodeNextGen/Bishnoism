import 'package:flutter/material.dart';
import 'package:zoomable_image/zoomable_image.dart';

class ZoomableImagePage extends StatelessWidget {
  final String imgPath;
  ZoomableImagePage(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: imgPath,
                child: ZoomableImage(AssetImage(imgPath), scale: 3.0),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                // I need to add a column to set the MainAxisSize to min,
                // otherwise the appbar takes all the screen and the image is no more clickable
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    leading:
                        Container(), // Overrides the go back arrow icon button
                    actions: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close, color: Colors.white),
                      ),
                    ],
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
