import 'package:flutter/material.dart';
import 'package:my_shop/pages/detail_page.dart';
import 'package:my_shop/pages/my_account_page.dart';
import 'package:my_shop/model/products.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int _currentIndex = 0;
  // final tabs = [MainPagePage(), MyAccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[50],
                        backgroundImage:
                            NetworkImage('https://picsum.photos/id/0/100/100'),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) {
                              return MyAccountPage();
                            }));
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
                      hintText: 'Search',
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
                buildContainer(),
                allProduct(),
              ],
            ),
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

  Container buildContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Sale',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    splashRadius: 25.0,
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey[500],
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Colors.blue[200],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Ink.image(
                      image: AssetImage('assets/images/book.png'),
                      height: 200,
                      width: 150,
                      fit: BoxFit.contain,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) {
                              return DetailPage();
                            })
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Colors.red[100],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Ink.image(
                      image: AssetImage('assets/images/laptop.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      child: InkWell(
                        // highlightColor: Colors.blue,
                        // splashColor: Colors.blue,
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Colors.green[300],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Ink.image(
                      image: AssetImage('assets/images/earphone.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Colors.deepPurple[200],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Ink.image(
                      image: AssetImage('assets/images/camera.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container allProduct() {
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
          // Padding(
          //   padding: EdgeInsets.all(5),
          //   child: GridView.count(
          //     crossAxisCount: 2,
          //     children: productList.map((e) => null),
          //   ),
          // )
        ],
      ),
    );
  }
}
