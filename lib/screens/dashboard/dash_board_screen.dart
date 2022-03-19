import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DashboardCard("dolar", CardIcons.dolar),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String _description;
  final CardIcons _icon;

  DashboardCard(this._description, this._icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 21, 18, 4),
      height: 127,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color(0xFF9500F6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            child: DashboardCardIcons.getIcon(_icon),
            alignment: Alignment.topLeft,
          ),
          Align(
              child: Text(
                _description,
                style: const TextStyle(
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

enum CardIcons {
  dolar
}
class DashboardCardIcons {
  static Widget getIcon(CardIcons type) {
    switch(type) {
      case CardIcons.dolar:
        return SvgPicture.asset('images/dolar_icon.svg');
    }
  }
}