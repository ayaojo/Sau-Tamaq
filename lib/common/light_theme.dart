import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEFEFE)),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return const Color(0xffB0B0B0);
        }
        return const Color(0xff1D3557);
      }),
      foregroundColor: const WidgetStatePropertyAll(Color(0xffFEFEFE)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      minimumSize: WidgetStateProperty.all(const Size(254, 65.0)),
    ),
  ),
);
