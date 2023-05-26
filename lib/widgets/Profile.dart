import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stepzilla/NavBar.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile>{

  FirebaseAuth mAuth = FirebaseAuth.instance;

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
      body: Stack(

        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/json/92323-dot-pattern-background.json',
              width: 500,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          buildTop(),
          buildContent()
        ],
      )
    );
  }
  Widget buildContent() {
    return Column(
      children: [
        SizedBox(height: 260),
        Text(
            'My Profile Page',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          mAuth.currentUser!.email!,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(FontAwesomeIcons.slack),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.linkedin),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.instagram),
            const SizedBox(width: 12,),
            buildSocialIcon(FontAwesomeIcons.strava),
            const SizedBox(width: 12,),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildFollowElement(text: 'Runs', value: 30),
            SizedBox(width: 10,),
            buildFollowElement(text: 'Following', value: 150),
            SizedBox(width: 10,),
            buildFollowElement(text: 'Followers', value: 234),
            SizedBox(width: 10,),
          ],
        ),

      ],
    );
  }
  Widget buildFollowElement({
    required String text,
    required int value,
}) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('$value',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
      ),
      SizedBox(height: 2),
      Text(text, style: TextStyle(fontSize: 20),)
    ],
  );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
    radius: 25,
    child: Center(child: Icon(icon, size: 32)),
  );

  Widget buildTop(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 30,
            child: buildProfileImage()
        ),

      ],
    );
  }
  Widget buildProfileImage() => CircleAvatar(
    radius: 100,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: NetworkImage
      ('https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80'),
  );
}