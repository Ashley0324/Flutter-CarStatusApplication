## 📱Flutter: Cars' Status Application
A small attempt to make a car's Status app in Flutter for Android, iOS and Web.
The M-Car app puts owners in direct communication with their vehicles and energy products anytime, anywhere. The advantage of this project is that it allows users to manage multiple cars from different brands.

### 🧑 Author
Ashley Jin: ashleyjin0324@gmail.com
If you'd like to contribute to the app, don't hestite to get in contact with me.

### ✨ Iphone Screenshots
<img width="575" alt="Screenshot 2022-05-12 at 01 15 57" src="https://user-images.githubusercontent.com/99146042/167968621-6af669b9-d48c-4aa7-a072-646ec8a2336f.png">

### 😃 Functions

With this app, you can:

- Locating vehicles with directions or track its movement
- Monitoring vehicles status(door, window, light)
- Checking the weather condition
- Recieving safe alarm

### 👩‍💻 Fit to all device screens

To fit all device screens, most widgets are proportional by taking the page size instead of giving it a fixed height
<img width="575" alt="Screenshot 2022-05-12 at 01 24 16" src="https://user-images.githubusercontent.com/99146042/167968753-57c6fd66-785d-4eb7-9f1d-1773c7eb0b48.png">

### 📊 Data Source
- Location: MQTT
- Weather: MQTT
- Vehicle Status: [API](https://developer.mercedes-benz.com/products/vehicle_status/specifications/vehicle_status_api)

### 💡 Requirements
- Any Operating System(ie. MacOs, Linux, Windows)
- Any IDE with Flutter installed(es. Android Studio)
- A little knowledge of Dart and Flutter
- An account of MQTT

### ✨ Challenges and Improvement
- Now the login part only completes the UI design. I'll authenticate and login users in Flutter from a REST Api.
- Mercedes company API could be used in a simulated environment for free. It assists me throughout the integration phase. But bill is needed to access real data. If this becomes a commercial project in the future, I will pay for this service.
- During the integration phase, I only used data from one car as an example. But the function of switching cars is done.
- Weather and location information is not included in Mercedes' free data set. The data displayed now is obtained by fetching from mqtt. This is data from UCL garden not a real car. Commercial projects should get real information from the car company API.

### ❤️ Build instructions
1. Download this project from this [github link](https://github.com/Ashley0324/CASA0015-Mobile-Systems-Interactions)
2. Replace the MQTT client and password
3. In your AndroidManifest.xml file, add the Internet permission.
5. Run App On any Simulator & Run App On your own Device

### 📗 Bibliography
- raywenderlich.com. 2022. Firebase Realtime Database Tutorial for Flutter. [online] Available at: <https://www.raywenderlich.com/24346128-firebase-realtime-database-tutorial-for-flutter> [Accessed 16 April 2022].
- Dart packages. 2022. mqtt_client | Dart Package. [online] Available at: <https://pub.dev/packages/mqtt_client> [Accessed 16 April 2022].
- Dart packages. 2022. mqtt_client | Dart Package. [online] Available at: <https://pub.dev/packages/mqtt_client> [Accessed 16 April 2022].
- Dart packages. 2022. mqtt_client | Dart Package. [online] Available at: <https://pub.dev/packages/mqtt_client> [Accessed 16 April 2022].
- Dart packages. 2022. http_api | Dart Package. [online] Available at: <https://pub.dev/packages/http_api> [Accessed 16 May 2022].
- Mercedes. [online] Available at: <https://developer.mercedes-benz.com/products/vehicle_status/specifications/vehicle_status_api> [Accessed 16 May 2022].
