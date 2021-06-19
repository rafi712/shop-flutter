import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  DetailScreen({required this.product});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.coverColor,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                tooltip: widget.product.onCart
                                  ? 'Remove from cart'
                                  : 'Add to cart',
                                onPressed: widget.product.stock == 0 
                                ? null
                                  : widget.product.onCart
                                    ? removeFromCart
                                    : addToCart,
                                icon: Icon(
                                  widget.product.onCart 
                                  ? Icons.remove_shopping_cart_outlined
                                  : Icons.add_shopping_cart
                                )
                              ),
                              IconButton(
                                iconSize: 26,
                                icon: Icon(
                                  widget.product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                  color: widget.product.isFavorite
                                    ? Colors.red
                                    : Colors.black,
                                ),
                                onPressed: widget.product.isFavorite
                                  ? removeFromFavorite 
                                  : addToFavorite,
                              )
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
                    child: Hero(
                      tag: widget.product.name,
                      child: Image(image: AssetImage(widget.product.imageUrl))
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25)
                      .copyWith(bottom: 5),
                  child: Text(
                    widget.product.name,
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
                    '\$${widget.product.price}',
                    style: TextStyle(fontSize: 23, color: Colors.white70),
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    (widget.product.stock == 0)
                      ? 'Sold out'
                      : 'Stock : ' + widget.product.stock.toString(),
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
          ),
          SafeArea(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                            onPressed: (widget.product.selectedItem == 1) 
                              ? null 
                              : () => setState(() => widget.product.selectedItem--),
                          ),
                          Text(
                            widget.product.selectedItem.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (widget.product.selectedItem >= widget.product.stock) 
                              ? null 
                              : () => setState(() => widget.product.selectedItem++),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (widget.product.stock == 0) ? null : buyProduct,
                      child: Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: widget.product.buttonColor,
                        minimumSize: Size(120, 47),
                        shape: StadiumBorder()
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
      )
    );
  }

  void addToFavorite() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });
    Product.favoriteItems.add(widget.product);

     ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(defaultSnackBar('Added to favorite items'));    
  }

  void removeFromFavorite() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });

    var currentProduct = Product.favoriteItems.firstWhere((item) => item.name == widget.product.name);
    Product.favoriteItems.remove(currentProduct);

     ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(defaultSnackBar('Removed from favorite items'));    
  }

  void addToCart() {
    setState(() {      
      widget.product.onCart= !widget.product.onCart;
    });
    Product.shoppingCart.add(widget.product);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(defaultSnackBar('Added to your shopping cart'));    
  }
  
  void removeFromCart() {    
    setState(() {
      widget.product.selectedItem = 1;
      widget.product.onCart= !widget.product.onCart;
    });

    var currentProduct = Product.shoppingCart.firstWhere((item) => item.name == widget.product.name);
    Product.shoppingCart.remove(currentProduct);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(defaultSnackBar('Removed from your shopping cart'));    
  }

  void buyProduct() {
    var currentProduct = Product.shoppingCart.firstWhere((item) => item.name == widget.product.name, orElse: () => null);
    if(currentProduct != null) {
      Product.shoppingCart.remove(currentProduct);
    }

    final snackBar = defaultSnackBar('You ordered ${widget.product.selectedItem} ${(widget.product.selectedItem == 1) ? 'item' : 'items'}');
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);

    setState(() {
      widget.product.stock -= widget.product.selectedItem;
      widget.product.selectedItem = 1;
      if(widget.product.onCart) widget.product.onCart = false;
    });    
  }

  SnackBar defaultSnackBar(String message) {
    return SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        message,
        style: TextStyle(fontSize: 17),
      ),
    );
  }  
}
