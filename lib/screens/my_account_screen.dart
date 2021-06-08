import 'package:flutter/material.dart';
import 'package:my_shop/screens/login_screen.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            splashRadius: 25.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 29, color: Colors.white70
                            ),
                          ),
                          IconButton(
                            splashRadius: 25.0,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }), 
                                (route) => false
                              );
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 29, color: Colors.white70
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://picsum.photos/id/0/100/100'),
                      maxRadius: 30,
                    ),
                    title: Text(
                      'My Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      'Regular Member',
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.favorite_border,
                      size: 29,
                      color: Colors.pink[300],
                    ),
                    title: Text('My Favourite'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  // dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.access_time,
                      size: 29,
                      color: Colors.red[500],
                    ),
                    title: Text('Recently Viewed'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 29,
                      color: Colors.yellow[700],
                    ),
                    title: Text('E-Wallet'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  // dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.local_activity_outlined,
                      size: 29,
                      color: Colors.purple[600],
                    ),
                    title: Text('My Voucher'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.person_outline,
                      size: 29,
                      color: Colors.blue[900],
                    ),
                    title: Text('Account Setting'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  // dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      size: 29,
                      color: Colors.green,
                    ),
                    title: Text('Help Center'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  // dividerLine(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Divider dividerLine() {
    return Divider(
      color: Colors.grey[350],
      height: 5,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
