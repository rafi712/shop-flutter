import 'package:flutter/material.dart';
import 'package:my_shop/components/favorite_button.dart';
import 'package:my_shop/model/products.dart';

class DetailScreen extends StatefulWidget {
  final Products product;
  DetailScreen({required this.product});

  @override
  _DetailScreenState createState() => _DetailScreenState(product);
}

class _DetailScreenState extends State<DetailScreen> {
  final Products product;
  _DetailScreenState(this.product);
  int item = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: product.coverColor,
      ),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 29,
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                    'Added to your shopping cart',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              },
                              icon: Icon(Icons.add_shopping_cart)),
                          FavoriteButton()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
              // color: Colors.white,
              child: Center(
                child: Image(image: AssetImage(product.imageUrl)),
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25)
                  .copyWith(bottom: 5),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                product.price,
                style: TextStyle(fontSize: 23, color: Colors.white70),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                (product.stock == 0) ? 'Sold out' : 'Stock : ' + product.stock.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Product Description :',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis dolore ea ipsa voluptatem distinctio asperiores aliquam. Recusandae impedit cumque, nostrum consectetur iure non ipsa praesentium eligendi! Fugiat distinctio itaque dolores?',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: (item == 1)
                              ? null
                              : () {
                                  setState(() => item--);
                                },
                        ),
                        Text(
                          item.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: (item >= product.stock)
                              ? null
                              : () {
                                  setState(() => item++);
                                },
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (product.stock == 0) ? null 
                        : () {
                      final snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'You ordered $item ${(item == 1) ? 'item' : 'items'}',
                          style: TextStyle(fontSize: 17),
                        )
                      );

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);

                      setState(() {
                        product.stock -= item;
                        item = 1;
                      });
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: product.buttonColor,
                        minimumSize: Size(120, 47),
                        shape: StadiumBorder()),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
