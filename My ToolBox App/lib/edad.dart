import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionScreen extends StatefulWidget {
  @override
  _AgePredictionScreenState createState() => _AgePredictionScreenState();
}

class _AgePredictionScreenState extends State<AgePredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  int? _age;
  String? _ageCategory;

  Future<void> getAge(String name) async {
    final response =
        await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    final decodedResponse = jsonDecode(response.body);

    setState(() {
      _age = decodedResponse['age'];
      if (_age! <= 25) {
        _ageCategory = 'young';
      } else if (_age! > 25 && _age! <= 60) {
        _ageCategory = 'adult';
      } else {
        _ageCategory = 'elderly';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predecir edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ingrese su nombre',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await getAge(_nameController.text);
              },
              child: Text('Predecir edad'),
            ),
            SizedBox(height: 20),
            _age == null
                ? Container()
                : Column(
                    children: [
                      Text(
                        'Edad: $_age',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _ageCategory == 'young'
                          ? Column(
                              children: [
                                Text(
                                  'Joven',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Image.network(
                                  'https://images.pexels.com/photos/708440/pexels-photo-708440.jpeg',
                                  width: 200,
                                  height: 200,
                                ),
                              ],
                            )
                          : _ageCategory == 'adult'
                              ? Column(
                                  children: [
                                    Text(
                                      'Adulto',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Image.network(
                                      'https://images.pexels.com/photos/3184405/pexels-photo-3184405.jpeg',
                                      width: 200,
                                      height: 200,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Text(
                                      'Anciano',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Image.network(
                                      'https://images.pexels.com/photos/34761/old-people-couple-together-connected.jpg',
                                      width: 200,
                                      height: 200,
                                    ),
                                  ],
                                ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
