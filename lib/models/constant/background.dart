
import 'package:flutter/material.dart';

class Background{
  static Decoration background=const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(image: AssetImage('assets/image/bkg.png'),fit: BoxFit.fill)
  );
}