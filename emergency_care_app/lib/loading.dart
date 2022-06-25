import 'package:emergency_care_app/constan/request_state.dart';
import 'package:emergency_care_app/start_page.dart';
import 'package:emergency_care_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScrenn extends StatefulWidget {
  static const ROUTE_NAME = 'loadingScreen';
  LoadingScrenn({Key? key}) : super(key: key);

  @override
  State<LoadingScrenn> createState() => _LoadingScrennState();
}

class _LoadingScrennState extends State<LoadingScrenn> {
  @override
  Widget build(BuildContext context) {
    Future.microtask(
        () => Provider.of<AppProvider>(context, listen: false)..fetchHome());
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, data, child) {
        final state = data.state;
        if (state == RequestState.Loading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Image.asset('assets/logo.png'),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const LinearProgressIndicator(
                  color: Color.fromARGB(244, 67, 54, 1),
                ),
              )
            ],
          );
        } else if (state == RequestState.Loaded) {
          return StartPage();
        } else {
          return const Center(child: Text('Error'));
        }
      }),
    );
  }
}
