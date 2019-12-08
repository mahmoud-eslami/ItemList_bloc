import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('splashScreen'),
            SizedBox(height: 25,),
            CircularProgressIndicator(
              strokeWidth: 1.7,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
