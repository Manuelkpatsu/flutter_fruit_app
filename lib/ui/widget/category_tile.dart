import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';

class CategoryTile extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback? onPressed;
  final BorderStyle style;
  final Color color;

  const CategoryTile({
    Key? key,
    required this.fruit,
    required this.onPressed,
    required this.style,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2.0,
                style: style,
              ),
            ),
          ),
          child: Text(
            fruit.name,
            style: TextStyle(
              color: color,
              fontSize: 16,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
