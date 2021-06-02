class Products {
  String name;
  String price;
  String imageUrl;

  Products({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

var productList = [
  Products(
    name: 'Laptop', 
    price: 'Rp7.000.000', 
    imageUrl: 'assets/images/laptop.png', 
  ),
  Products(
    name: 'Book', 
    price: 'Rp50.000', 
    imageUrl: 'assets/images/book.png', 
  ),
  Products(
    name: 'Smartphone', 
    price: 'Rp2.000.000', 
    imageUrl: 'assets/images/phone.png', 
  ),
  Products(
    name: 'Bag', 
    price: 'Rp400.000', 
    imageUrl: 'assets/images/bag.png', 
  ),
  Products(
    name: 'Shoe', 
    price: 'Rp700.000', 
    imageUrl: 'assets/images/shoe.png', 
  ),
  Products(
    name: 'Earphone', 
    price: 'Rp1.000.000', 
    imageUrl: 'assets/images/earphone.png', 
  ),
  Products(
    name: 'T-shirt', 
    price: 'Rp100.000', 
    imageUrl: 'assets/images/shirt.png', 
  ),
  Products(
    name: 'Sofa', 
    price: 'Rp2.500.000', 
    imageUrl: 'assets/images/sofa.png', 
  ),
  Products(
    name: 'Camera', 
    price: 'Rp359.000', 
    imageUrl: 'assets/images/camera.png', 
  ),
  Products(
    name: 'Speaker', 
    price: 'Rp150.000', 
    imageUrl: 'assets/images/speaker.png', 
  ),
];
