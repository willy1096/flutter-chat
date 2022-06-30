import 'package:flutter/material.dart';

import 'package:chat/models/users.dart';
import 'package:chat/widgets/custom_text_widget.dart';
import '../../../styles/styles.dart';

class CardChatWidget extends StatelessWidget {
  final Users user;
  const CardChatWidget({ 
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
        Navigator.pushNamed(context, '/chat');
      },
      title: CustomTextWidget(
        title:user.name!,
        type: 'secundary',
      ),
      subtitle:CustomTextWidget(
        title:'Hola como estás?',
        type: 'tertary',
      ),
      leading:Container(
        padding:const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(50.0)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            user.avatar!,
            width:43,
            height:100,
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          user.online! ?
          const Icon(Icons.circle,size: 10,color: colorPrimary,)
          : const Text(''),
          user.online! ?
          CustomTextWidget(title:'Justo ahora',)
          :
          CustomTextWidget(title:'Ayer',)
        ],
      ), 
      dense: true,
    );
  }
}
