import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../models/utils.dart';


class SignUpWidget extends StatefulWidget{

  final VoidCallback onClickSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickSignIn
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends State<SignUpWidget>{

  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final imageTemp = File(image.path);

    setState((){
      _image = imageTemp;
      });
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
            child: CircularProgressIndicator()
        )
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
    }


    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Lottie.asset(
            'assets/json/92323-dot-pattern-background.json',
            width: 500,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
            SingleChildScrollView(
            padding: EdgeInsets.only(top: 120, left: 15, right: 15),
            child: Form(
            key: formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('assets/icons/running-man-logo-final.png', width: 250,
            height: 260,
            fit: BoxFit.cover
            ),
            SizedBox(height: 40),
            TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
            email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email' : null,
            ),
            SizedBox(height: 4),
            TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true ,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
            value != null && value.length<6
            ? 'Enter min. 6 characters' : null,
            ),
              SizedBox(height: 10,),
            TextButton(
                onPressed: getImage,
                child: _image == null ?
                  const Text('Click here to select image!')
                    :const Text('Picture selected! Click again to change!')
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            backgroundColor: Color(0xFF2eb5e9)
            ),
            icon: Icon(Icons.login, size: 32),
            label: Text(
            'Sign up',
            style: TextStyle(fontSize: 24),
            ),
            onPressed: signUp
            ),
            SizedBox(height: 24),
            RichText(
            text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
            color: Color(0xFF2eb5e9),
            fontSize: 18,
            ),
            children: [
            TextSpan(
            recognizer: TapGestureRecognizer()
            ..onTap = widget.onClickSignIn
            ,
            text: "Log In",
            style: TextStyle(color: Colors.redAccent, fontSize: 18)
            )
            ]
            ),
            )

            ],),)

        )
      ]
    );

  }


}