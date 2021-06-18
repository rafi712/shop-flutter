import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';
import 'package:my_shop/screens/detail_screen.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
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
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),
        ),
        actions: (Product.shoppingCart.length > 0) ? [
          IconButton(
            splashRadius: 20,
            onPressed: (){
              setState(() {
                Product.shoppingCart.forEach((product) {
                  product.onCart = false;
                  product.selectedItem = 1;
                });
                Product.shoppingCart.clear();
              });
            }, 
            icon: Icon(
              Icons.delete_outlined, 
              color: Colors.black,
              size: 25,
            )
          )
        ] : null,
      ),
      body: (Product.shoppingCart.length != 0) ? Stack(
        children: [
          Container(
            color: Colors.blue[100],
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 25),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: Product.shoppingCart.map((product) => GestureDetector(
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
                    margin: EdgeInsets
                      .symmetric(horizontal: 8)
                      .copyWith(bottom: (Product.shoppingCart.indexOf(product) == Product.shoppingCart.length - 1) ? 80 : 10),
                    width: double.infinity,
                    height: 134,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
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
                          flex: 3,
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
                                  '\$${product.price * product.selectedItem}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add),
                                  splashRadius: 1,
                                  onPressed: (product.selectedItem >= product.stock) ? null : () => setState(() => product.selectedItem++),
                                ),
                                Text(product.selectedItem.toString()),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  splashRadius: 1,
                                  onPressed: (product.selectedItem == 1) ? null : () => setState(() => product.selectedItem--),
                                ),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                )).toList(),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(                
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-1, 0),
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 2
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TOTAL PRICE',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${totalPrice()}',
                              style: TextStyle(
                                fontSize: 19,
                                // fontWeight: FontWeight.bold
                              ),
                            ),                          
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: buyAll, 
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Buy All', style: TextStyle(fontSize: 16)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder()
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ],
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
                image: AssetImage('assets/images/empty-cart.png')
              ),
              SizedBox(height: 25),
              Text(
                'Your shopping cart is empty',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void buyAll() {
    final snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        'Transactions are completed',
        style: TextStyle(fontSize: 17),
      ),
    );

    ScaffoldMessenger.of(context)..showSnackBar(snackBar);
    setState(() {
      Product.shoppingCart.forEach((product) {
        product.stock -= product.selectedItem;
        product.selectedItem = 1;
        product.onCart = false;
      });
      Product.shoppingCart.clear();
    }); 
  }

  String totalPrice() {
    num total = 0;
    Product.shoppingCart.forEach((item) {
      total = total + item.price * item.selectedItem;
    });
    return total.toString();
  }
}