import 'package:flutter/material.dart';

class ByteBankTextField extends StatefulWidget {
  final TextEditingController _controller;
  final String _label;
  final String _hint;
  final Icon? icon;
  final TextInputType keyboardType;

  ByteBankTextField(this._controller, this._label, this._hint, this.keyboardType, {this.icon});

  @override
  State<StatefulWidget> createState() {
    return _ByteBankTextFieldState ();
  }
}

class _ByteBankTextFieldState extends State<ByteBankTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget._controller,
        keyboardType: widget.keyboardType,
        style: const TextStyle(fontSize: 24, color: Colors.white),
        decoration: InputDecoration(
          icon: widget.icon,
          labelText: widget._label,
          hintText: widget._hint,
        ),
      ),
    );
  }

}
