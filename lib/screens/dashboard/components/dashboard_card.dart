import 'package:flutter/material.dart';
import '../../../components/ds_icon.dart';

class DashboardCard extends StatelessWidget {
  final String _description;
  final Ds_icons _icon;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Default_icons.getIcon(_icon),
          Text(
            _description,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
