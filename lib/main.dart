import 'package:flutter/material.dart';
import 'package:jr_group/home/home.dart';
import 'package:jr_group/res/constants.dart';

import 'home/temp.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
        ),
        // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: const HomeScreen(),
      )
  );
}



