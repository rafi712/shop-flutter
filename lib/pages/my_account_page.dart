import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
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
                    )
                  ),
                  IconButton(
                    splashRadius: 25.0,
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white70,
                    )
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/id/0/100/100'),
                radius: 30,
              ),
              title: Text(
                'My Name', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                'Regular Member',
                style: TextStyle(
                  color: Colors.grey[300]
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.78,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), 
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.favorite_border,
                      size: 29,
                      color: Colors.pink[400],
                    ),
                    title: Text('My Favourite'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onLongPress: () {},
                  ),
                  dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 29,
                      color: Colors.green,
                    ),
                    title: Text('E-Wallet'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onLongPress: () {},
                  ),
                  dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.access_time,
                      size: 29,
                      color: Colors.red[500],
                    ),
                    title: Text('Recently Viewed'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onLongPress: () {},
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
                    onLongPress: () {},
                  ),
                  dividerLine(),
                  ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      size: 29,
                      color: Colors.purple[600],
                    ),
                    title: Text('Help Center'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onLongPress: () {},
                  ),
                  dividerLine(),

                ],
              ),
            )
          ],
        ),
      )
    );
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
