import 'package:chat/styles/styles.dart';
import 'package:flutter/material.dart';

class CardMessageChatWidget extends StatelessWidget {
  final String? uid, txt;
  final AnimationController animationController;
  const CardMessageChatWidget({
      Key? key,
      required this.uid,
      required this.txt,
      required this.animationController
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid == '123' ?
            _myMessage()
            :
            _notMyMessage()
        ),
      ),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin:const EdgeInsets.only(bottom: 4.0),
        padding:const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: colorSecundary.withOpacity(0.2),
          borderRadius:BorderRadius.circular(50.0)
        ),
        child: Text("$txt"),
      )
    );
  }
 
  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:const EdgeInsets.only(bottom: 4.0),
        padding:const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.2),
          borderRadius:BorderRadius.circular(50.0)
        ),
        child: Text("$txt"),
      )
    );
  }
}