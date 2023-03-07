import 'package:flutter/material.dart';
import 'package:helloworld/menu.dart';
import 'package:helloworld/genero.dart';
import 'package:helloworld/edad.dart';
import 'package:helloworld/universidad.dart';
import 'package:helloworld/clima.dart';
import 'package:helloworld/contacto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'My Exam App',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Menu'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mi caja de herramientas!',
            ),
            SizedBox(height: 20), // added some space between text and image
            Image.network(
              'https://images.pexels.com/photos/8470252/pexels-photo-8470252.jpeg', // replace with your image URL
              width: 400, // set image width as per your requirement
              height: 200, // set image height as per your requirement
            ),
          ],
        ),
      ),
    );
  }
}
