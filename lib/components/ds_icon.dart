import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum Ds_icons { dolar }

mixin Default_icons {
  static Widget getIcon(Ds_icons type) {
    switch (type) {
      case Ds_icons.dolar:
        return SvgPicture.asset('images/dolar_icon.svg');
    }
  }
}