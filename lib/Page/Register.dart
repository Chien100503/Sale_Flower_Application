import 'dart:convert';
import 'package:cannabis/Page/Login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

import '../Db/Config.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool? isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 77)),
              Image(image: AssetImage('lib/assets/logo.png')),
              Text(
                'Create Your',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Account',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
              SizedBox(
                height: 35,
              ),
              buildTextField("Email Address", emailController, TextInputType.emailAddress),
              SizedBox(
                height: 30,
              ),
              buildTextFieldWithSuffixIcon(
                  "Password", passwordController, _obscureText, TextInputType.visiblePassword),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.blueGrey,
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool;
                      });
                    },
                  ),
                  Container(
                    width: 279,
                    child: Text(
                      'By creating an account you agree with our terms and conditions',
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  registerUser();
                },
                child: Container(
                  height: 48,
                  width: 315,
                  decoration: BoxDecoration(color: Color(0xff81AA66)),
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 42,
              ),
              buildAlreadyMemberRow(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller, TextInputType inputType) {
    return SizedBox(
      width: 315,
      height: 56,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 19),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff81AA66)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff81AA66)),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: inputType,
      ),
    );
  }

  Widget buildTextFieldWithSuffixIcon(String labelText, TextEditingController controller, bool obscureText, TextInputType inputType) {
    return SizedBox(
      width: 315,
      height: 56,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 19),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff81AA66)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff81AA66)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            color: obscureText ? Colors.blueGrey : Color(0xff81AA66),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        keyboardType: inputType,
      ),
    );
  }

  Widget buildAlreadyMemberRow() {
    return Row(
      children: [
        Padding(padding: EdgeInsets.all(45)),
        Text('Already a member?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey)),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: Text('Log in ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff81AA66))),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: Login(),
                    type: PageTransitionType.rightToLeft));
          },
        ),
      ],
    );
  }

  // API
  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isValidEmail(emailController.text) &&
        passwordController.text.length >= 6) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(
        Uri.parse(registration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonRseponse = jsonDecode(response.body);
      print(addProduct);

      if(response.statusCode == 409){
        showErrorMessage('Email already exists.');
      }

      if (jsonRseponse['status']) {
        showSnackBarMessage(
            'You have successfully registered.', Color(0xff81AA66));
        Future.delayed(Duration(seconds: 4), () {
          Navigator.push(
            context,
            PageTransition(
              child: Login(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        });
      } else {
        if (jsonRseponse['message'] != null) {
          showErrorMessage(jsonRseponse['message']);
        } else {
          showErrorMessage('Registration failed.');
        }
      }

    } else if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showErrorMessage('Please enter email and password.');
    } else if (passwordController.text.length < 6) {
      showErrorMessage('Password must be longer than 6 characters.');
    } else {
      showErrorMessage('Email is not in a valid format.');
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  bool isValidEmail(String email) {
    String emailPattern =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  void showErrorMessage(String message) {
    showSnackBarMessage(message, Colors.red);
  }

  void showSnackBarMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
      ),
    );
  }
}