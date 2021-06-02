import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';

class DetailPage extends StatelessWidget {
  // final Products product;
  // DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: Column(
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
                      )
                    ),
                    IconButton(
                      splashRadius: 25.0,
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white70,
                      )
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              // color: Colors.white,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/book.png')
                ),
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(left: 25).copyWith(bottom: 5),
              child: Text(
                'Text Book', 
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 33,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Rp7.000.000',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70
                ),
              ),
            )
          ],
        ),        
      )
    );
  }
}