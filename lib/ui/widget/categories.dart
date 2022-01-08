import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';
import 'package:flutterfruitapp/ui/screen/product_screen.dart';
import 'package:flutterfruitapp/ui/widget/category_tile.dart';
import 'package:flutterfruitapp/ui/widget/fruit_show_tile.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      _selectCategoryIndex();
    });
    super.initState();
  }

  _selectCategoryIndex() {
    Timer(const Duration(milliseconds: 400), () {
      var newIndex = _controller.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex.round();
        });
      }
    });
  }

  _scrollToItem(index) {
    double position = index * 210.0;

    if (_controller.hasClients) {
      _controller.animateTo(
        position,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _listCategory(),
        _fruitShow(),
      ],
    );
  }

  Widget _listCategory() {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: fruitItems.length,
        itemBuilder: (context, int index) {
          FruitItem fruit = fruitItems[index];

          return CategoryTile(
            fruit: fruit,
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });

              _scrollToItem(_selectedIndex);
            },
            style: _selectedIndex == index ? BorderStyle.solid : BorderStyle.none,
            color: _selectedIndex == index ? Colors.black : Colors.grey,
          );
        },
      ),
    );
  }

  Widget _fruitShow() {
    return Container(
      height: 370,
      margin: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fruitItems.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          FruitItem fruit = fruitItems[index];

          return FruitShowTile(
            fruit: fruit,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductScreen(
                    fruit: fruit,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
