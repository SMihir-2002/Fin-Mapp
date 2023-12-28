import 'package:fin_mapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  void navigate(context) async {
    await Future.delayed(const Duration(milliseconds: 800));
    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) =>const MyHomePage(title: "About Home Loan",))
                      , (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100,
              ),
              const CircularProgressIndicator()
            ]),
      ),
    );
  }
}
