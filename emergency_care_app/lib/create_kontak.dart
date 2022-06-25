import 'package:emergency_care_app/db/model/kontak.dart';
import 'package:emergency_care_app/home.dart';
import 'package:emergency_care_app/panggilan.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CreateKontakPage extends StatelessWidget {
  static const ROUTE_NAME = 'createKontak';
  final List<dynamic> data;
  CreateKontakPage({Key? key, required this.data}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController nomerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.ROUTE_NAME);
              },
              icon: const Icon(
                Icons.home,
                size: 35,
              ))
        ],
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Panggilan Darurat',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
                controller: nomerController,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                ),
                onSaved: (String? value) {}),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                var insertData = KontakModel(
                    phone: nomerController.text, nama: nameController.text);
                await MyApp().database.insertKontak(insertData);
                Navigator.pushNamed(context, PanggilanDaruratPage.ROUTE_NAME);
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
