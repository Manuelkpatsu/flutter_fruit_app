import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';

class NewItemTile extends StatelessWidget {
  final FruitItem fruit;

  const NewItemTile({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            offset: const Offset(0, 25),
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: -20.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image(
            height: 70.0,
            width: 70.0,
            image: AssetImage("assets/fruits/${fruit.image}"),
          ),
          Text(
            fruit.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3.0),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey[600], fontSize: 9.0),
              children: <TextSpan>[
                TextSpan(
                    text: fruit.price + ".00",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "(${fruit.kg})"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
