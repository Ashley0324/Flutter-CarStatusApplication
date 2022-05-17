import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/category_card.dart';
import 'weather.dart';
import 'window.dart';
import 'door.dart';
import 'light.dart';
import 'status2.dart';

class StatusPage extends StatelessWidget{
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
        home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context)
        .size; //Give the total height and width of the device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height * .40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDFABE8),Color(0xFFFCC3C6)],
                ),
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
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  height: 52,
                  width: 52,

                  decoration: BoxDecoration(
                    color:Color(0xFFFA6B74),
                    shape:BoxShape.circle,
                  ),
                  child:IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context)=>StatusPage2()
                          )
                      );
                    },
                  )
    ),
    ),
    Text(
    "\nWelcome, \nAshley",
        style:TextStyle(
        fontSize: 40,
        color: Color(0xFF3D0007),
        fontWeight: FontWeight.w900,
    ),
    ),
              Text(
                "Connecting to your Tesla\n",
                style:TextStyle(
                  fontSize: 14,
                  color: Color(0xD744262D),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: size.width*0.06,
                  mainAxisSpacing: size.width*0.06,
                  children: <Widget>[
                    CategoryCard(
                      title: "Weather",
                      svgSrc: "assets/icons/wind.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return WeatherPage();
                          }),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Window",
                      svgSrc: "assets/icons/window.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return WindowPage();
                          }),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Door",
                      svgSrc: "assets/icons/door.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return DoorPage();
                          }),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Light",
                      svgSrc: "assets/icons/light.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LightPage();
                          }),
                        );
                      },
                    ),
                  ],
                ),
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