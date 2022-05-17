import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCard extends StatelessWidget{
  final String svgSrc;
  final String title;
  final String data;
  const WeatherCard({
    Key key,
    this.svgSrc,
    this.title,
    this.data
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x79DC5555),
              offset: Offset(0, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    svgSrc,
                    width:size.width*0.15,
                    height:size.width*0.15,
                  ),
                  Spacer(),
                  Text(
                      data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFEF7269),
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  Spacer(),
                  Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3D0007),
                        fontWeight: FontWeight.w300,
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}