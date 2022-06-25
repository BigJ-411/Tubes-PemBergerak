import 'package:emergency_care_app/constan/penanganan_p3k_data.dart';
import 'package:emergency_care_app/penanganan_p3k_detail.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class PenangananP3KPage extends StatelessWidget {
  static const ROUTE_NAME = 'penangananP3KPage';
  List data = PenangananP3KData().p3kData;
  PenangananP3KPage({Key? key}) : super(key: key);

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
          'Penanganan P3K',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  data: data[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
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
  const Card({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = data['image'];
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PenangananP3KDetail.ROUTE_NAME,
            arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 133, 127),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 94, 86),
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset('assets/$image'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(data['judul']),
            )
          ],
        ),
      ),
    );
  }
}
