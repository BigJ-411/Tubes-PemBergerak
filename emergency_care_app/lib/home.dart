import 'package:emergency_care_app/maps.dart';
import 'package:emergency_care_app/obat.dart';
import 'package:emergency_care_app/panggilan.dart';
import 'package:emergency_care_app/penanganan_p3k.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const ROUTE_NAME = 'homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Center(child: Image.asset('assets/logo-putih.png')),
              ),
              Container(
                margin: const EdgeInsets.only(top: 130),
                child: const Center(
                  child: Text(
                    'e-care',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Card(
            title: 'Penanganan P3K',
            icon: Image.asset('assets/penanganan.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Card(
            title: 'Obat-Obatan',
            icon: Image.asset('assets/obat.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Card(
            title: 'Panggilan Darurat',
            icon: Image.asset('assets/phone.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Card(
            title: 'Hospital',
            icon: Image.asset('assets/hati.png'),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final Widget? icon;
  const Card({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (title == 'Penanganan P3K') {
          Navigator.pushNamed(
            context,
            PenangananP3KPage.ROUTE_NAME,
          );
        } else if (title == 'Obat-Obatan') {
          Navigator.pushNamed(
            context,
            ObatPage.ROUTE_NAME,
          );
        } else if (title == 'Panggilan Darurat') {
          Navigator.pushNamed(
            context,
            PanggilanDaruratPage.ROUTE_NAME,
          );
        } else {
          Navigator.pushNamed(context, MapsPage.ROUTE_NAME);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 47, 66, 75),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
