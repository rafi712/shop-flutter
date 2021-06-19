import 'package:flutter/material.dart';

class Product {
  String name, imageUrl;
  Color coverColor, buttonColor;
  bool isFavorite, onCart;
  int stock, selectedItem, price;
  static List shoppingCart = [];
  static List favoriteItems = [];

  Product({
    required this.name,
    required this.imageUrl,
    required this.stock,
    required this.coverColor,
    required this.price,
    required this.buttonColor,
    this.selectedItem = 1,
    this.isFavorite = false,
    this.onCart = false
  });
}

var productList = [
  Product(
    name: 'Camera',
    price: 150,
    imageUrl: 'assets/images/camera.png',
    stock: 20,
    coverColor: Colors.deepPurple[300]!,
    buttonColor: Colors.deepPurple[600]!,
  ),
  Product(
    name: 'Sofa',
    price: 300,
    imageUrl: 'assets/images/sofa.png',
    stock: 5,
    coverColor: Colors.indigo[300]!,
    buttonColor: Colors.indigo,
  ),
  Product(
    name: 'Book',
    price: 3,
    imageUrl: 'assets/images/book.png',
    stock: 100,
    coverColor: Colors.blue[300]!,
    buttonColor: Colors.blue[800]!,
  ),
  Product(
    name: 'Shoe',
    price: 23,
    imageUrl: 'assets/images/shoe.png',
    stock: 36,
    coverColor: Colors.teal[300]!,
    buttonColor: Colors.teal[700]!,
  ),
  Product(
    name: 'Earphone',
    price: 75,
    imageUrl: 'assets/images/earphone.png',
    stock: 68,
    coverColor: Colors.green[300]!,
    buttonColor: Colors.green[900]!,
  ),
  Product(
    name: 'Bag',
    price: 15,
    imageUrl: 'assets/images/bag.png',
    stock: 14,
    coverColor: Colors.red[300]!,
    buttonColor: Colors.red[400]!,
  ),
  Product(
    name: 'Speaker',
    price: 30,
    imageUrl: 'assets/images/speaker.png',
    stock: 2,
    coverColor: Colors.deepOrange[300]!,
    buttonColor: Colors.deepOrange,
  ),
  Product(
    name: 'Smartphone',
    price: 200,
    imageUrl: 'assets/images/phone.png',
    stock: 17,
    coverColor: Colors.brown[300]!,
    buttonColor: Colors.brown[600]!,
  ),
];
