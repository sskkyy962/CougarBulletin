
import 'package:flutter/material.dart';
import 'package:cougar_bulletin/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cougar_bulletin/feed_page.dart';

class RegistrationScreen extends StatefulWidget {
   static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
 String email;
 String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
              children:<Widget>[Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                  child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.jpg'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                
                 keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 20.0,color: Colors.black.withOpacity(0.2)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
               
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 20.0,color: Colors.black.withOpacity(0.2)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: 'Register',colour: Colors.blueAccent,onPressed: ()async{
                try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser !=null){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => FeedPage()),);
                  }
                }
                catch(e){
                  print(e);
                }
                
                },
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}


