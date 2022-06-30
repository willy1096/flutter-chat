import 'package:flutter/material.dart';
import '../styles/styles.dart';

class CustomTextWidget extends StatelessWidget {
  final String? type;
  final String? title;
  CustomTextWidget({
     Key? key,
     required this.title,
     this.type = 'info',

  }) : super(key: key);

  final Map<String,dynamic> _listStyle = {
    "primary":{
      'size':20.0,
      'weight':FontWeight.bold,
      'color':colorSecundary,
    },
    "secundary":{
      'size':16.0,
      'weight':FontWeight.w700,
      'color':colorSecundary,
    },
    "tertary":{
      'size':14.0,
      'weight':FontWeight.w400,
      'color':colorSecundary,
    },
    "info":{
      'size':12.0,
      'weight':FontWeight.normal,
      'color':colorSecundary,
    },
  };

  @override
  Widget build(BuildContext context) {
    return  Text(
      "$title",
      style: TextStyle(
        color: _listStyle[type]['color'],
        fontSize: _listStyle[type]['size'],
        fontWeight:  _listStyle[type]['weight']
      ),
    );
  }
}