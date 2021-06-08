import 'package:flutter/material.dart';
import 'package:my_shop/model/products.dart';
import 'package:my_shop/screens/detail_screen.dart';


class BestSaleCards extends StatelessWidget {
  const BestSaleCards(this.context);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                    fontSize: 25, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  splashRadius: 20.0,
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey[500],
                  )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 150,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: Card(
                    color: Colors.blue[300],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
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
                              return DetailScreen(
                                product: productList[2],
                              );
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
                    color: Colors.red[300],
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Ink.image(
                      image: AssetImage('assets/images/bag.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailScreen(product: productList[5]);
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DetailScreen(product: productList[4]);
                            })
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

