import 'package:flutter/material.dart';
import 'theme/style.dart';
import 'page/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 520),
          GradientBtnWidget(
            width: 208,
            height:400,
            child: Text(
              "Sign Up",
              style:TextStyle(
                color:Color(0xFFECECEC),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            )
          ),
          SizedBox(height: 16),
          GestureDetector(
            child: LoginBtnWidget(),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>LoginPage()
                  )
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
      decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage(
                'assets/images/2.jpg',
            ),
            fit: BoxFit.fill,
          ),
    )
    );
  }
}

/// Login in Type
class LoginTypeIconWidget extends StatelessWidget {
  const LoginTypeIconWidget({
    Key key,
    this.icon,
  }) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        icon,
        width: 16,
        height: 16,
      ),
    );
  }
}

/// Login Button
class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBtnShadow,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Text(
        'Login',
        style: kBtnTextStyle,
      ),
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
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

