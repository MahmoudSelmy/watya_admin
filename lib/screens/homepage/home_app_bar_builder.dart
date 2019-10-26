import 'package:flutter/material.dart';

class HomeAppBar
{
  static Widget build(BuildContext context)
  {
    return new AppBar(
      elevation: 0.1,
      backgroundColor: Colors.black,
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/homepage/title.png', fit: BoxFit.cover,),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.black,
            ),
          )
        ],
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