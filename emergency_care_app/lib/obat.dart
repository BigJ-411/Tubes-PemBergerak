import 'package:emergency_care_app/constan/obat.dart';
import 'package:emergency_care_app/obat_detail.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class ObatPage extends StatelessWidget {
  static const ROUTE_NAME = '/obat';
  final List data = Obat().data;
  ObatPage({Key? key}) : super(key: key);

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
          'Obat Obatan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  data: data[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 18,
                );
              },
              itemCount: data.length,
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final Map<String, dynamic> data;
  const Card({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ObatDetailPage.ROUTE_NAME,
          arguments: data,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              spreadRadius: -5,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            data['title'],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
