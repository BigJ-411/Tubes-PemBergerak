import 'package:emergency_care_app/home.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  static const ROUTE_NAME = 'startPage';

  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Image.asset(
              'assets/home.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 530,
            ))
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 430, left: 10),
          child: const Text(
            'Welcome To',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 462, left: 10),
          child: const Text(
            'Emergency Care',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 43,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 560),
          child: const Text(
            'Aplikasi Terbaik Untuk Menangani Pertolongan pertama',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 600),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.ROUTE_NAME);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                child: Text(
                  "Let's Start",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ))
      ],
    );
  }
}
