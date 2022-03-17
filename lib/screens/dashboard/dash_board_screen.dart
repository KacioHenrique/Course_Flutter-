import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DashboardCard(),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 21, 18, 4),
      height: 127,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.purple[600],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            // child: Icon(
            //   Icons.agriculture_rounded,
            //   size: 24,
            //   color: Colors.white,
            // ),
            child: Image.asset('assets/images/pix_icon.png'),
            alignment: Alignment.topLeft,
          ),
          Align(
              child: Text(
                "pay",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.bottomLeft),
        ],
      ),
    );
  }
}
