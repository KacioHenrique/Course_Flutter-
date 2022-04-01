import 'package:flutter/material.dart';

class BankAlertDialogAuth extends StatefulWidget {
  final String _title;
  final Function(String password) onConfirm;

  const BankAlertDialogAuth(this._title, {required this.onConfirm, Key? key}) : super(key: key);

  @override
  State<BankAlertDialogAuth> createState() => _BankAlertDialogAuthState();
}

class _BankAlertDialogAuthState extends State<BankAlertDialogAuth> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget._title),
      content: TextField(
        obscureText: true,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 64,
          letterSpacing: 16,
          decoration: TextDecoration.none
        ),
        maxLength: 4,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        controller: _controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_controller.text);
            Navigator.pop(context);
          },
          child: const Text('confirm'),
        ),
      ],
    );
  }
}
