import 'package:flutter/material.dart';
import 'package:helloworld/contacto.dart';
import 'package:helloworld/genero.dart';
import 'package:helloworld/edad.dart';
import 'package:helloworld/universidad.dart';
import 'package:helloworld/clima.dart';
import 'package:helloworld/contacto.dart';

//Hector A. Veloz 2019-7999
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hector A. Veloz De La Rosa'),
            accountEmail: Text('20197888@itla.edu.do'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://scontent.fsdq2-1.fna.fbcdn.net/v/t1.6435-9/170118470_2629592547337984_1012737173597241692_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEUxaRkm8uxxlqiwE5086FVU3LiixeCVdtTcuKLF4JV2_ZGt7NqcRWZVbWEUomEvJ5aVDkx80vNyuD6dcRjimj9&_nc_ohc=tVPQakPMaccAX8g7Qe6&tn=WHbgoLgKb5ukooKj&_nc_ht=scontent.fsdq2-1.fna&oh=00_AfC0QCj5W_fPTR4jY60hqJihl7ZPnmzrE3M3oXgjC2AZFw&oe=64110295',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://fastly.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_sharp),
            title: Text('Inicio'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.male),
            title: Text('Predicción de género'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GenderPredictionScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time_sharp),
            title: Text('Predicción de Edad'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgePredictionScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Buscador de Universidades'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UniversitiesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text('Clima de RD'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Contacto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
