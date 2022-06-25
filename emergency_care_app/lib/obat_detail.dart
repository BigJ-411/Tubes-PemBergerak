import 'package:flutter/material.dart';

import 'home.dart';

class ObatDetailPage extends StatelessWidget {
  static const ROUTE_NAME = '/obat/detail';
  final Map<String, dynamic> data;
  const ObatDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var obat = data['obats'][index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(data: obat),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: data['obats'].length,
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
    var image = data['image'];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            spreadRadius: -5,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 150,
            child: Image.asset('assets/$image'),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  data['nama'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                data['aturan_pakai'],
                style: TextStyle(fontSize: 8),
              ),
            ],
          )
        ],
      ),
    );
  }
}
