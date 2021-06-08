import 'package:flutter/material.dart';
import 'package:my_shop/components/all_product_cards.dart';
import 'package:my_shop/components/best_sale_cards.dart';
import 'package:my_shop/screens/my_account_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          child: ListView(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/id/0/100/100'),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MyAccountScreen();
                              })
                            );
                          },
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      IconButton(
                          splashRadius: 25.0,
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Discover our best \nproducts',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Search product',
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 13),
                    enabledBorder: searchInputBorder(),
                    focusedBorder: searchInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 25),
              BestSaleCards(context),
              AllProductCards(context),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder searchInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.transparent, width: 1));
  }
}

