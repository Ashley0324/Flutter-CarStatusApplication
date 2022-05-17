import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MC/page/status.dart';
import 'package:MC/page/location.dart';
import 'package:MC/page/alarm.dart';

class BottomNavBar extends StatelessWidget{
  const BottomNavBar({
    Key key,
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          BottomNavItem(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>LocationPage()
                  )
              );
            },
            title:"Location",
            svgScr: "assets/icons/location.svg",
          ),
          BottomNavItem(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>StatusPage()
                  )
              );
            },
            title:"Status",
            svgScr: "assets/icons/home.svg",
          ),
          BottomNavItem(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>AlarmPage()
                  )
              );
            },
            title:"Alarm",
            svgScr: "assets/icons/alarm.svg",
          ),
        ],
      )
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key,
    this.svgScr,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            height: 28.0,
            width: 28.0,
            color: isActive ? Color(0xFFE68342) : Color(0xFF222B45),),
          Text(
            title,
            style: TextStyle(color: isActive ? Color(0xFFE68342) : Color(0xFF222B45),),
          ),
        ],
      ),
    );
  }
}