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
      backgroundColor: Colors.blue[400],
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, top: 35),
                height: 120,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.white   
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(150)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildLoginForm(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          children: [
                            Text(
                              'or',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            SizedBox(height: 10),
                            OutlinedButton.icon(
                              onPressed: (){}, 
                              icon: Image.asset(
                                'assets/images/google-logo.png',
                                width: 25,
                                height: 25,
                              ), 
                              label: Text(
                                'Login with google',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                shape: StadiumBorder(),
                                side: BorderSide(
                                  color: Colors.blue
                                )
                              ),
                            )
                          ]
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?', style: TextStyle(fontSize: 15)),
                          TextButton(
                            onPressed: () {},
                            
                            child: Text('Register', style: TextStyle(fontSize: 15))
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 70),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Your username...',
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                  width: 2
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[300]!,
                  width: 2
                )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Your password...',
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: isPasswordVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
                onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                  width: 2
                )
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[300]!,
                  width: 2
                )
              ),
            ),
          ),
          SizedBox(height: 55),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen())
                );
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
            ),
          )
        ],
      ),
    );
  }
}
