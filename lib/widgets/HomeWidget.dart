import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: Color(0xFF2eb5e9),
            ),
            icon: Icon(Icons.logout, size: 32),
            label: Text(
              'Sign out',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: (){
              FirebaseAuth.instance.signOut();
            }
        ),
      )
    );
  }

}