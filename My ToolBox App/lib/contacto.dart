import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacto',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacto'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20), // added some space between text and image
              Image.network(
                'https://scontent.fsdq2-1.fna.fbcdn.net/v/t1.6435-9/170118470_2629592547337984_1012737173597241692_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEUxaRkm8uxxlqiwE5086FVU3LiixeCVdtTcuKLF4JV2_ZGt7NqcRWZVbWEUomEvJ5aVDkx80vNyuD6dcRjimj9&_nc_ohc=tVPQakPMaccAX8g7Qe6&tn=WHbgoLgKb5ukooKj&_nc_ht=scontent.fsdq2-1.fna&oh=00_AfC0QCj5W_fPTR4jY60hqJihl7ZPnmzrE3M3oXgjC2AZFw&oe=64110295', // replace with your image URL
                width: 400, // set image width as per your requirement
                height: 200, // set image height as per your requirement
              ),
              Text(
                'Nombre: Alejandro Veloz',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Teléfono: (829) 379-8156',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Correo: alejandrovelozinf@gmail.com',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
