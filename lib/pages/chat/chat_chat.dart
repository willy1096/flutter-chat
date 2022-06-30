import 'dart:io';

import 'package:chat/pages/chat/widgets/card_message_chat_widget.dart';
import 'package:chat/styles/styles.dart';
import 'package:chat/widgets/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatChat extends StatefulWidget {
  const ChatChat({ Key? key }) : super(key: key);

  @override
  State<ChatChat> createState() => _ChatChatState();
}

class _ChatChatState extends State<ChatChat> with TickerProviderStateMixin {
  final List<CardMessageChatWidget> _listMessage = [
    // const CardMessageChatWidget(uid: '123', txt:'Hola Muendo'),
    // const CardMessageChatWidget(uid: '123', txt:'Como estasestasestasestasestasestas hola univero?'),
    // const CardMessageChatWidget(uid: '12433', txt:'donde'),
    // const CardMessageChatWidget(uid: '123', txt:'...'),
    // const CardMessageChatWidget(uid: '12433', txt:'Por supuesdo donde nos vemos para poder pensar'),
    // const CardMessageChatWidget(uid: '12433', txt:'Universo'),
  ];
  final TextEditingController _txtCtrl = TextEditingController();
  bool? _writing = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose

    for( CardMessageChatWidget message in _listMessage){
      message.animationController.dispose();
    }
    _focusNode.dispose();
    

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  const InkWell(
                    child: Icon(
                      Icons.arrow_back,
                      color: colorSecundary,
                    ),
                  ),
                  const SizedBox(width: 4,),
                  const CircleAvatar(
                    child: Text('Fe'),
                  ),
                  const SizedBox(width: 4,),
                  Flexible(
                    child: CustomTextWidget(
                      title:'Fernando Cruz',
                      type: 'secundary',
                    )
                  )
                ],
              )
            ),
          
           const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Three'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical:0,horizontal: 10),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),
                reverse: true,
                itemCount: _listMessage.length,
                itemBuilder: (_,i)=>_listMessage[i]
              )
            ),
            const Divider(height: 1,),
            _inputChat()
          ],
        ),
      )
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                textInputAction: TextInputAction.send,
                controller: _txtCtrl,
                onSubmitted:_handleSubmit,
                onChanged: (String txt){
                    txt.trim().length > 0
                    ?
                    setState(() => _writing = true )
                    :
                    setState(() => _writing = false );
                    
                },
                focusNode: _focusNode,
                decoration:const InputDecoration.collapsed(
                  hintText: 'Escribir...'
                ),
              )
            ),
            Container(
              child: Platform.isIOS ? 
              CupertinoButton(
                child:const Text('Envíar'),
                onPressed:_writing == true ? () => _handleSubmit(_txtCtrl.text) : null,
              )
              :
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 0.0),
                child: IconButton(
                  splashColor: colorPrimary.withOpacity(0.4),
                  highlightColor: colorPrimary.withOpacity(0.4),
                  onPressed:_writing == true ? () => _handleSubmit(_txtCtrl.text) : null,
                  icon:const Icon(Icons.send,color:colorPrimary),
                ),
              )
            )
          ],
        ),
      )
    );
  }
  _handleSubmit(String txt){
    final newMessage = CardMessageChatWidget(
      uid: '123',
      txt: txt,
      animationController: AnimationController(vsync: this,duration:const Duration(milliseconds: 200)),
    );
    _listMessage.insert(0, newMessage);
    newMessage.animationController.forward();
    _focusNode.requestFocus();
    _txtCtrl.clear();
    setState(() => _writing = false );
  }
}