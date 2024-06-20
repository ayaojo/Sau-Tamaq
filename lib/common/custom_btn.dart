import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final Function()? onTap;

  const CustomBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: const Color(0xff1D3557), borderRadius: BorderRadius.circular(10.0)),
        child: const Center(
          child: Text('sign in',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
