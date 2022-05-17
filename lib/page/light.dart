import 'package:flutter/material.dart';
import 'widgets/status_card.dart';
import 'status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LightPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Car',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
      ),
      home: LightScreen(),
    );
  }
}

class LightScreen extends StatelessWidget{
  String interiorFront = 'Closed';
  String interiorRear = 'Closed';
  String readingLampLeft = 'Closed';
  String readingLampRight= 'Closed';
  String switchLight = 'Closed';
  getData() async{
    var apiUrl = Uri.parse('https://api.mercedes-benz.com/vehicledata_tryout/v2/vehicles/WDB111111ZZZ,',);
    var response = await http.get(apiUrl,
        headers:{
          'Authorization':'Bearer 4c4c444c-v123-4123-s123-4c4c444c4c44',
          'Accept':'application/json;charset=utf-8'
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response.body is String);
    print(json.decode(response.body));
    List doorList = json.decode(response.body)['value'];
    var a = doorList[6];
    var b = doorList[7];
    var c = doorList[8];
    var d = doorList[9];
    var e = doorList[10];

    if(a){
      interiorFront = 'Open';
    }
    if(b){
      interiorRear = 'Open';
    }
    if(c){
      readingLampLeft = 'Open';
    }
    if(d){
      readingLampRight = 'Open';
    }
    if(e){
      switchLight = 'Open';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context)
        .size; //Give the total height and width of the device
    DateTime now = DateTime.now();
    String convertedDateTime = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB8FFB9),Color(0xFFECE3AA)],
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context)=>StatusPage()
                                )
                            );
                          },
                        )
                    ),
                  ),
                  Text(
                    "\nLight Status",
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
                        status: interiorFront,
                        title: "Interior Front",
                      ),
                      StatusCard(
                        status: interiorRear,
                        title: "Interior Rear",
                      ),
                      StatusCard(
                        status: readingLampLeft,
                        title: "Reading Lamp Left",
                      ),
                      StatusCard(
                        status: readingLampRight,
                        title: "Reading Lamp Right",
                      ),
                      StatusCard(
                        status: switchLight,
                        title: "Switch Light",
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