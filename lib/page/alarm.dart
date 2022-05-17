import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/status_card.dart';

class AlarmPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Car',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
        textTheme: Theme.of(context).textTheme.apply(displayColor: Color(
            0xFF1F0E0E),),
      ),
      home: AlarmScreen(),
    );
  }
}

class AlarmScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context)
        .size;
    DateTime now = DateTime.now();
    String convertedDateTime = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body:  Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height *0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFC0B8),Color(0xFFECEBAA)],
              ),
              color: Color(0xFFEECDA8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\n\nAlarm",
                    style:TextStyle(
                      fontSize: 40,
                      color: Color(0xFF3D0007),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                      "\n 📍 London",
                      style:TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3B0033),
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  Text(
                      "$convertedDateTime\n",
                      style:TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3B2733),
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  Wrap(
                    spacing:20,
                    runSpacing: 20,
                    children: <Widget>[
                      StatusCard(
                        status: "😟",
                        title: "Sanroof is open",
                      ),
                      StatusCard(
                        status: "😟",
                        title: "Interior Rear is open",
                      ),
                      StatusCard(
                        status: "😟",
                        title: "Reading Lamp is open",
                      ),
                      StatusCard(
                        status: "😟",
                        title: "Rainy day",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
