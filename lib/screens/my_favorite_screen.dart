import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';
import 'package:my_shop/screens/detail_screen.dart';
import 'package:my_shop/screens/main_screen.dart';

class MyFavoriteScreen extends StatefulWidget {
  @override
  _MyFavoriteScreenState createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Text(
          'My Favorite',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),
        ),
      ),
      body: (Product.favoriteItems.length != 0)
      ? Container(
        color: Colors.blue[100],
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: Product.favoriteItems.map((product) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(product: product)
                  )
                ).then((_) => setState(() {}));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 10),
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: product.coverColor,
                          ),
                          child: Hero(
                            tag: product.name,
                            child: Image(image: AssetImage(product.imageUrl))
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )).toList(),
          ),
        ),
      ) : Center(
        child: Container(
          width: double.infinity,
          color: Colors.blue[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 100,
                height: 100, 
                image: AssetImage('assets/images/empty-favorite.png')
              ),
              SizedBox(height: 25),
              Text(
                'You haven\'t favorited any product yet',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: (Product.favoriteItems.length == 0) 
        ? FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return MainScreen();
              }), (route) => false
            );
          },
          child: Icon(Icons.add),
        ) : null,
    );
  }
}