import 'package:flutter/material.dart';
import 'widgets/status_card.dart';
import 'status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WindowPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Car',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
      ),
      home: WindowScreen(),
    );
  }
}

class WindowScreen extends StatelessWidget{
  String sunroof = 'Closed';
  String frontLeft = 'Closed';
  String frontRight = 'Closed';
  String rearLeft = 'Closed';
  String rearRight = 'Closed';
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
    List theList = json.decode(response.body)['value'];
    var a = theList[11];
    var b = theList[12];
    var c = theList[13];
    var d = theList[14];
    var e = theList[15];

    if(a){
      sunroof = 'Open';
    }
    if(b){
      frontLeft = 'Open';
    }
    if(c){
      frontRight = 'Open';
    }
    if(d){
      rearLeft = 'Open';
    }
    if(e){
      rearRight = 'Open';
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
            height: size.height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB8D0FF),Color(0xFFCBAAEC)],
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
                    "\nWindow Status",
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
                          status: sunroof,
                          title: "Sunroof",
                        ),
                        StatusCard(
                          status: frontLeft,
                          title: "Front Left",
                        ),
                        StatusCard(
                          status: frontRight,
                          title: "Front Right",
                        ),
                        StatusCard(
                          status: rearLeft,
                          title: "Rear Left",
                        ),
                        StatusCard(
                          status: rearRight,
                          title: "Rear Right",
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