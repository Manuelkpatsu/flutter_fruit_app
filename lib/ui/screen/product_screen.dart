import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfruitapp/model/fruit_item.dart';

class ProductScreen extends StatelessWidget {
  final FruitItem fruit;

  const ProductScreen({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(fruit.color)),
      appBar: AppBar(
        backgroundColor: Color(int.parse(fruit.color)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height < 600
              ? null
              : MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    Center(
                      child: Text(
                        fruit.name,
                        style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: fruit.name,
                        child: Image(
                          image: AssetImage("assets/fruits/" + fruit.image),
                          height: 300.0,
                          width: 300.0,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        fruit.longDescription,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 15.0,
                      left: 20.0,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: fruit.price + ".00",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18.0)),
                            TextSpan(
                                text: " ${fruit.kg}",
                                style: const TextStyle(fontSize: 14.0)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 60.0,
                        width: 120.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Color(int.parse(fruit.color)),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
