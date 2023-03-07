import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class University {
  String name;
  String domain;
  String website;

  University({required this.name, required this.domain, required this.website});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      domain: json['domains'][0],
      website: json['web_pages'][0],
    );
  }
}

class UniversitiesScreen extends StatefulWidget {
  @override
  _UniversitiesScreenState createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  final _searchController = TextEditingController();
  List<University> _universities = [];

  Future<void> _getUniversities(String country) async {
    final response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=${country.replaceAll(' ', '+')}'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _universities = data.map((json) => University.fromJson(json)).toList();
      });
    } else {
      throw Exception('Hubo un fallo al cargar las universidades');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Pais',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Buscar'),
              onPressed: () async {
                await _getUniversities(_searchController.text);
              },
            ),
            if (_universities.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_universities[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dominio: ${_universities[index].domain}'),
                        Text('Website: ${_universities[index].website}'),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
