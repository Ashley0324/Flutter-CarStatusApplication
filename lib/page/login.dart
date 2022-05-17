import 'package:flutter/material.dart';
import 'dart:math';
import 'status.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children:[
          Column(
            children: [
              Container(
                // Here the height of the container is 45% of our total height
                height: size.height * .40,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFDFABE8),Color(0xFFFCC3C6)],
                  ),
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/1.png"),
                  ),
                ),
              ),
              LoginBodyWidget(),
            ],
          ),
        ],
      ),
    );
  }
}


class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 86),
          Text(
            'Login',
            style: TextStyle(
              fontSize:24,
              color:Color(0xFF3D0007),
              fontWeight:FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your Email',
            style: TextStyle(
              fontSize:14,
              color:Color(0xFF3D0007),
              fontWeight:FontWeight.w300,
            ),
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            'Your Password',
            style:TextStyle(
              fontSize: 14,
              color: Color(0xFF3D0007),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Password',
            prefixIcon: 'assets/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWidget(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  const LoginInput({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width:1,
            color:Color(0xFFECECEC),
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width:1,
              color:Color(0xFFECECEC),
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width:1,
              color:Color(0xFFECECEC),
            )
        ),
        prefixIcon: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          child: Image.asset(
            prefixIcon,
            width: 24,
            height: 24,
          ),
        ),
      ),
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 18,
        color:Color(0xFFFEDCE0),
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class LoginBtnIconWidget extends StatelessWidget {
  const LoginBtnIconWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(width: 34),
              BtnTextWhiteWidget(
                text: 'Login',
              ),
              Spacer(),
              Image.asset(
                'assets/icons/icon_arrow_right.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 24),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context)=>StatusPage()
                )
            );
          },
        )
      ],
    );
  }
}

/// Gradient Button
class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({
    Key key,
    this.width,
    this.height,
    this.child,
    this.onTap,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFA6B74),Color(0xFFF89500)],
          ),
          boxShadow:[
            BoxShadow(
              color: Color(0x33D83131),
              offset: Offset(0, 8),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class BtnTextWhiteWidget extends StatelessWidget {
  const BtnTextWhiteWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize:18,
        fontWeight: FontWeight.w300,
      ),
      );
  }
}
