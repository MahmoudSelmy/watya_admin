import 'package:flutter/material.dart';

class HomeAppBar
{
  static Widget build()
  {
    return new AppBar(
      elevation: 0.1,
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('images/homepage/title.png', fit: BoxFit.cover,),
      ),
      actions: <Widget>[
        buildIconButton(Icons.search, Colors.yellow.shade700),
        buildIconButton(Icons.shopping_cart, Colors.white)
      ],
    );
  }

  static IconButton buildIconButton(IconData icon, Color color) {
    return new IconButton(
        icon: new Icon(
          icon,
          color: color,
        ),
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        });
  }
}