import 'package:flutter/material.dart';
import 'package:my_shop/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue[300]!],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight
            )
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              buildLoginForm(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I\'m a new user.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                        TextButton(
                          onPressed: (){}, 
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple[400]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ]
          )
        ),
      ),
    );
  }


// Container(
//               height: MediaQuery.of(context).size.height / 2,
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/cart.png',
//                   height: 200,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
  Widget buildLoginForm() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: 'Your username...',
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
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
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIcon: IconButton(
                icon: isPasswordVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainScreen();
                }));
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          )
        ],
      ),
    );
  }
}
