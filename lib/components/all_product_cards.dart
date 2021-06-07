import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';
import 'package:my_shop/screens/detail_screen.dart';

class AllProductCards extends StatelessWidget {
  const AllProductCards(this.context);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'All Products',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1.4,
            crossAxisCount: 2,
            children: productList.map((product) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailScreen(product: product);
                    })
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: product.coverColor,
                        height: 150,
                        child: Image.asset(
                          product.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.all(8).copyWith(left: 15),
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        child: Text(
                          product.price,
                          style: TextStyle(
                            fontSize: 16, color: Colors.black54),
                        )
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }
}
