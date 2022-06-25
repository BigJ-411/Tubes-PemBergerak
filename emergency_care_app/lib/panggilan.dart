import 'package:emergency_care_app/create_kontak.dart';
import 'package:emergency_care_app/db/model/kontak.dart';
import 'package:emergency_care_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'home.dart';

class PanggilanDaruratPage extends StatefulWidget {
  static const ROUTE_NAME = 'PanggilanDarurat';

  PanggilanDaruratPage({Key? key}) : super(key: key);

  @override
  State<PanggilanDaruratPage> createState() => _PanggilanDaruratPageState();
}

class _PanggilanDaruratPageState extends State<PanggilanDaruratPage> {
  List data = [];

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
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: MyApp().database.getKontak(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List data = snapshot.data as List;
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        name: data[index]['nama'],
                        telpon: data[index]['phone'],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: data.length,
                  );
                }
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateKontakPage.ROUTE_NAME,
              arguments: data);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String name;
  final String telpon;
  const Card({Key? key, required this.name, required this.telpon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool? res = await FlutterPhoneDirectCaller.callNumber(telpon);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 100,
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
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                KontakModel data = KontakModel(phone: telpon, nama: name);
                await MyApp().database.removeKontak(data);
                Navigator.pushNamed(context, PanggilanDaruratPage.ROUTE_NAME);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 224, 224, 224),
                shadowColor: Color.fromARGB(255, 224, 224, 224),
              ),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    telpon,
                    style:
                        const TextStyle(fontSize: 22, color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
