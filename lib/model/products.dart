import 'package:flutter/material.dart';
class Products {
   String name;
   String price;
   String imageUrl;
   Color coverColor;
   Color buttonColor;

  Products({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.coverColor,
    required this.buttonColor,
  });
}

var productList = [
  Products(
    name: 'Camera', 
    price: 'Rp359.000', 
    imageUrl: 'assets/images/camera.png', 
    coverColor: Colors.deepPurple[300]!,
    buttonColor: Colors.deepPurple[600]!
  ),
  Products(
    name: 'Sofa', 
    price: 'Rp2.500.000', 
    imageUrl: 'assets/images/sofa.png', 
    coverColor: Colors.indigo[300]!,
    buttonColor: Colors.indigo
  ),
  Products(
    name: 'Book', 
    price: 'Rp50.000', 
    imageUrl: 'assets/images/book.png', 
    coverColor: Colors.blue[300]!,
    buttonColor: Colors.blue[800]!
  ),
  Products(
    name: 'Shoe', 
    price: 'Rp700.000', 
    imageUrl: 'assets/images/shoe.png', 
    coverColor: Colors.teal[300]!,
    buttonColor: Colors.teal[700]!
  ),
  Products(
    name: 'Earphone', 
    price: 'Rp1.000.000', 
    imageUrl: 'assets/images/earphone.png', 
    coverColor: Colors.green[300]!,
    buttonColor: Colors.green[900]!
  ),
  Products(
    name: 'Bag', 
    price: 'Rp400.000', 
    imageUrl: 'assets/images/bag.png', 
    coverColor: Colors.red[300]!,
    buttonColor: Colors.red[400]!
  ),
  Products(
    name: 'Speaker', 
    price: 'Rp150.000', 
    imageUrl: 'assets/images/speaker.png', 
    coverColor: Colors.deepOrange[300]!,
    buttonColor: Colors.deepOrange
  ),
  Products(
    name: 'Smartphone', 
    price: 'Rp2.000.000', 
    imageUrl: 'assets/images/phone.png', 
    coverColor: Colors.brown[300]!,
    buttonColor: Colors.brown[600]!
  ),
];
