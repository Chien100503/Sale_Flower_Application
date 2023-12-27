import 'dart:convert';
import 'package:cannabis/Components/DashBoard.dart';
import 'package:cannabis/Page/Home.dart';
import 'package:cannabis/Page/Register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Db/Config.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool? isChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  SharedPreferences? preferences;

  void initSharedPref() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  //******LOGIN*******
  void loginUser() async {
    SharedPreferences local = await SharedPreferences.getInstance();

    if (validateFields()) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        local.setString('token', myToken);
        local.setString('userId', jsonResponse['userId']);
        print('check token ${local.getString('userId')}');

        showSnackBar('You have successfully logged in.');

        Future.delayed(Duration(seconds: 4), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeIndex(token: myToken),
            ),
          );
        });
      } else {
        showSnackBar('Incorrect email or password.');
      }
    }
  }

  bool validateFields() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar('Please enter email and password.');
      return false;
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: message.contains('successfully') ? Color(0xff81AA66) : Colors.red,
        content: Text(message),
      ),
    );
  }

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
                'Wellcome to',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text('My App',
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
              buildTermsAndConditionsRow(),
              SizedBox(
                height: 42,
              ),
              buildLoginButton(),
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
    errorText: _isNotValidate ? "Enter Proper Info" : null,
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
          errorText: _isNotValidate ? "Enter Proper Info" : null,
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

  Widget buildTermsAndConditionsRow() {
    return Row(
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
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return InkWell(
      onTap: () {
        loginUser();
      },
      child: Container(
        height: 48,
        width: 315,
        decoration: BoxDecoration(color: Color(0xff81AA66)),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ),
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
          child: Text('Register',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff81AA66))),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: Register(),
                    type: PageTransitionType.rightToLeft));
          },
        )
      ],
    );
  }
}
