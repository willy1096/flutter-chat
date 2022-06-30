import 'package:flutter/material.dart';
import '../styles/styles.dart';

class CustomInputWidget extends StatelessWidget {
            
  final IconData? icon;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isPassword;

  const CustomInputWidget({ 
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(bottom: 20),
      padding:const EdgeInsets.only(left: 0,right: 15,top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.circular(15.0),
        boxShadow:<BoxShadow>[
          BoxShadow(
            color:Colors.black.withOpacity(0.2),
            offset:const Offset(0,1),
            blurRadius: 3
          )
        ]
      ),
      child: TextField(
        controller:controller,
        obscureText: isPassword,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon:Icon(
            icon,
            color:colorPrimary ,
          ),
          hintText:placeholder,
        ),
      ),
    );
  }
}