import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';

import 'new_item_tile.dart';

class NewItems extends StatelessWidget {
  const NewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      margin: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0))),
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: const Text(
                "New Items",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruitItems.length,
              itemBuilder: (BuildContext context, int index) {
                FruitItem fruit = fruitItems[index];

                return NewItemTile(fruit: fruit);
              },
            ),
          )
        ],
      ),
    );
  }
}
