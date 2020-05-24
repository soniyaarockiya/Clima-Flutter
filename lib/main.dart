import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
//      initialRoute: '/',
//      routes: {
//        //loading screen displays a double bounce loading indicator till the current location
//        //and the weather is being retrieved
//
//        '/': (context) => LoadingScreen(),
//
//        //Once all the details are retrieved, the location screen is then displayed with all the details
//        'locationScreen': (context) => LocationScreen(),
//      },
    );
  }
}
