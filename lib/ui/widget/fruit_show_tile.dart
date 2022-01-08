import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';

class FruitShowTile extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback? onPressed;

  const FruitShowTile({
    Key? key,
    required this.fruit,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      width: 210.0,
      decoration: BoxDecoration(
        color: Color(int.parse(fruit.color)),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0,
              offset: const Offset(0, 30),
              color: Color(int.parse(fruit.color)).withOpacity(0.6),
              spreadRadius: -20.0)
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  fruit.name,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: fruit.price + ".00",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " (" + fruit.kg + ")")
                  ]),
                )
              ],
            ),
          ),
          Hero(
            tag: fruit.name,
            child: Image(
              image: AssetImage("assets/fruits/" + fruit.image),
              width: 150.0,
              height: 150.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              fruit.description,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              primary: Colors.black.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
            child: const Text(
              "Add to cart",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

