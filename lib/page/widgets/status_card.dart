import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget{
  final String title;
  final String status;
  const StatusCard({
    Key key,
    this.title,
    this.status,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x791F1F1F),
              offset: Offset(0, 2),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF3D0007),
                        fontWeight: FontWeight.w300,
                      )
                  ),
                  Spacer(),
                  Text(
                      status,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFAF7299),
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}