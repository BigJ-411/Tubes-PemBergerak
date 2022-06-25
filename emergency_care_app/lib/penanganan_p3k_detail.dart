import 'package:flutter/material.dart';

import 'home.dart';

class PenangananP3KDetail extends StatelessWidget {
  static const ROUTE_NAME = '/penangan_p3k/detail';
  final Map data;
  const PenangananP3KDetail({Key? key, required this.data}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  data['judul'],
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Penjelasan',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    data['penjelasan'],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Cara Penanganan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var penanganan = data['penanganan'][index];
                  return ListTile(
                    leading: const MyBullet(),
                    title: Text(
                      penanganan['deskripsi'] ?? penanganan['nama_penanganan'],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: data['penanganan'].length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      height: 5,
      width: 5,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
