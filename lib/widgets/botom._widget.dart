import 'package:flutter/material.dart';
import '../styles/styles.dart';

class CustomButtomWidget extends StatelessWidget {
  final Function()? callbackAction;
  final String title;

  const CustomButtomWidget({ 
    Key? key,
    required this.callbackAction,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width:double.infinity ,
        margin:const EdgeInsets.symmetric(vertical: 20,),
        child: MaterialButton(
          onPressed:callbackAction,
          child: Text(title),
          color: colorPrimary,
          elevation: 0,
          padding:const EdgeInsets.only(top:13,bottom:13),
        )
    );
  }
}