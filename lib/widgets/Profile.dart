import 'package:flutter/material.dart';
import 'package:stepzilla/NavBar.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('This is a example page for the profile section!')
          ],
        ),
      ),
    );
  }
}