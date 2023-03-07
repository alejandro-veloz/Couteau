import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPredictionScreen extends StatefulWidget {
  @override
  _GenderPredictionScreenState createState() => _GenderPredictionScreenState();
}

class _GenderPredictionScreenState extends State<GenderPredictionScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _gender;

  Future<void> getGender(String name) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    final decodedResponse = jsonDecode(response.body);

    setState(() {
      _gender = decodedResponse['gender'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de género'),
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
                await getGender(_nameController.text);
              },
              child: Text('Predecir género'),
            ),
            SizedBox(height: 20),
            _gender == null
                ? Container()
                : _gender == 'male'
                    ? Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Masculino',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            'Femenino',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
