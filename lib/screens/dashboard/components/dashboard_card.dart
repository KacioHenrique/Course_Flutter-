import 'package:flutter/material.dart';
import '../../../components/ds_icon.dart';

class DashboardCard extends StatefulWidget {
  final String _description;
  final Ds_icons _icon;
  final void Function() _onTap;

  DashboardCard(this._description, this._icon, this._onTap);

  @override
  State<DashboardCard> createState() {
    return _DashBoardCardState(_description, _icon, _onTap);
  }
}

class _DashBoardCardState extends State<DashboardCard> {
  final String _description;
  final Ds_icons _icon;
  final void Function() _onTap;

  _DashBoardCardState(this._description, this._icon, this._onTap);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.fromLTRB(18, 21, 18, 4),
      height: 127,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: const Color(0xFF9500F6),
      ),
      duration: const Duration(seconds: 1),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Default_icons.getIcon(_icon),
            Text(
              _description,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onTap: () => setState(() {
          _onTap();
        }),
      ),
    );
  }
}
