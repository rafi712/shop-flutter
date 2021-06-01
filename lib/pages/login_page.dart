import 'package:flutter/material.dart';
import 'package:my_shop/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () => {
            FocusScope.of(context).requestFocus(FocusNode())
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildLoginForm(),        
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/shop.png')
                    )
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 25.0,),
      // decoration: BoxDecoration(
      //     color: Colors.orange[50],
      //     borderRadius: BorderRadius.circular(20)
      // ),
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.brown[900],
              fontSize: 35.0,
              fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Your username...',
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Your password...',
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              suffixIcon: IconButton(
                icon: isPasswordVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () =>
                    setState(() => isPasswordVisible = !isPasswordVisible),
              ),
            ),
          ),
          SizedBox(height: 55),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return MainPage();
                  }
                ));
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

