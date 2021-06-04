import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    splashRadius: 25.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 29,
                      // color: Colors.white70,
                    )
                  ),
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
                    // color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(
                  'Regular Member',
                  style: TextStyle(
                    // color: Colors.grey[300]
                  ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.78,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  // color: Colors.purple,
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
