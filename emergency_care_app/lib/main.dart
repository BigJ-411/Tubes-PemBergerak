import 'package:emergency_care_app/create_kontak.dart';
import 'package:emergency_care_app/db/database_helper.dart';
import 'package:emergency_care_app/home.dart';
import 'package:emergency_care_app/loading.dart';
import 'package:emergency_care_app/maps.dart';
import 'package:emergency_care_app/obat_detail.dart';
import 'package:emergency_care_app/panggilan.dart';
import 'package:emergency_care_app/penanganan_p3k.dart';
import 'package:emergency_care_app/penanganan_p3k_detail.dart';
import 'package:emergency_care_app/provider/app_provider.dart';
import 'package:emergency_care_app/start_page.dart';
import 'package:emergency_care_app/obat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DatabaseHelper database = DatabaseHelper();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emergency App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LoadingScrenn(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case LoadingScrenn.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => LoadingScrenn());
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case PenangananP3KPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PenangananP3KPage());
            case StartPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => StartPage());
            case ObatPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => ObatPage());
            case PanggilanDaruratPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PanggilanDaruratPage());
            case MapsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => MapsPage());
            case PenangananP3KDetail.ROUTE_NAME:
              var argument = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => PenangananP3KDetail(data: argument));
            case ObatDetailPage.ROUTE_NAME:
              var argument = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => ObatDetailPage(data: argument));
            case CreateKontakPage.ROUTE_NAME:
              var argument = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                  builder: (_) => CreateKontakPage(data: argument));
          }
        },
      ),
    );
  }
}
