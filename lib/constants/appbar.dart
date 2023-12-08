import 'package:flutter/material.dart';

class AppBarInvoice extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function() onPressed;

  const AppBarInvoice({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.blue[900],
      leading: IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
