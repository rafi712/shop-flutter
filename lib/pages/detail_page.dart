import 'package:flutter/material.dart';

// import 'package:my_shop/model/products.dart';
class DetailPage extends StatefulWidget {
  // final Products product;
  // DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int minItem = 1;
  int item = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
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
                        )),
                    IconButton(
                      iconSize: 30,
                      splashRadius: 25.0,
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
              // color: Colors.white,
              child: Center(
                child: Image(image: AssetImage('assets/images/book.png')),
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 25).copyWith(bottom: 5),
              child: Text(
                'Text Book',
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
                'Rp7.000.000',
                style: TextStyle(fontSize: 23, color: Colors.white70),
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
                          onPressed: () {
                            setState(() {
                              if (item > minItem) {
                                item--;
                              }
                            });
                          },
                        ),
                        Text(item.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item++;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[800],
                      minimumSize: Size(120, 47),
                      shape: StadiumBorder()
                    ),
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
