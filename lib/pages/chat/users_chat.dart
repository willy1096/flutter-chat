import 'package:chat/models/users.dart';
import 'package:chat/pages/chat/widgets/card_chat_widget.dart';
import 'package:chat/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../styles/styles.dart';
class UsersChat extends StatefulWidget {
  const UsersChat({ Key? key }) : super(key: key);

  @override
  State<UsersChat> createState() => _UsersChatState();
}

class _UsersChatState extends State<UsersChat> {
  final RefreshController _refreshController =  RefreshController(initialRefresh: false);

  final List<Users>_users = [
    Users(uid: '1', name: 'Fernando Cruz', email: 'fernando@gmail.com', phone: '9998765412', 
    avatar:'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
    online: true),
    Users(uid: '2', name: 'Alberto Sanchez', email: 'alberto@gmail.com', phone: '9993561222', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: false),
    Users(uid: '3', name: 'Santiado Peréz', email: 'santiago@gmail.com', phone: '9996532432', 
    avatar:'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
    online: false),
    Users(uid: '4', name: 'Beronica Sandoval', email: 'beronica@gmail.com', phone: '9991234445', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: false),
    Users(uid: '5', name: 'Fernanda Chi', email: 'fernanda@gmail.com', phone: '9999875436', 
    avatar:'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
    online: false),
    Users(uid: '6', name: 'José Peréz', email: 'joseperez@gmail.com', phone: '9998792456', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: false),
    Users(uid: '7', name: 'Efrain Moo', email: 'eframoo@gmail.com', phone: '9997356842', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: false),
    Users(uid: '8', name: 'Luis Cach', email: 'luiscach@gmail.com', phone: '9997143695', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: false),
    Users(uid: '9', name: 'Antonieta Puc', email: 'antopuc@gmail.com', phone: '9999876542', 
    avatar:'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
    online: false),
    Users(uid: '10', name: 'Alexandra Tamayo', email: 'aletamyo@gmail.com', phone: '9991326548', 
    avatar:'https://www.theportlandclinic.com/wp-content/uploads/2019/07/Person-Curtis_4x5-e1564616444404-300x300.jpg',
    online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title:CustomTextWidget(
          title: 'Usuarios',
          type: 'primary',
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon:const Icon(Icons.power_settings_new_rounded,color: colorSecundary,)
        ),
        actions:const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.check_circle_rounded,color: colorPrimary,),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SmartRefresher(
              controller:_refreshController,
              enablePullDown: true,
              onRefresh: _getUsers,
              header: const WaterDropHeader(
                complete: Icon(Icons.check,color: colorPrimary,),
                waterDropColor: colorSecundary,
              ),
              child:_listViewCard(),
              
            ),
          ),
        ],
      )
    );
  }

  Widget _listViewCard() {
    
    return 
    _users.isEmpty?
    _listUsersConnected()
    :   
    ListView.separated(
        physics:const BouncingScrollPhysics(),
        itemBuilder:(_,i)=>Column(
          children: [
            i==0?_listUsersConnected():Container(),
            CardChatWidget(user: _users[i])
          ],
        ),
        separatorBuilder:(_,i)=>const Divider(),
        itemCount: _users.length
    );
  }
  _getUsers()async{
     await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  Widget _listUsersConnected(){
    return  Container(
            height:120,
            margin:const EdgeInsets.all(0),
            padding:const  EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount:_users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,i)=> _users[i].online==true? Column(
                children:  [
                    Stack(
                      children: [
                        Container(
                          margin:const EdgeInsets.symmetric(horizontal:5),
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              _users[i].avatar!,
                              fit:BoxFit.cover
                            ),
                          ),
                        ),
                        Positioned(
                          bottom:0,
                          right:10,
                          child: Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: colorPrimary
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        width: 60,
                        margin:const EdgeInsets.symmetric(horizontal:5),
                        child: CustomTextWidget(
                          title:_users[i].name!,
                          type: 'tertary',
                        )
                      )
                    ),
                ],
              ):Container()
            ),
          );
  }
}