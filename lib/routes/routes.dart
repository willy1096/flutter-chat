import 'package:flutter/material.dart';

import 'package:chat/pages/loading.dart';
import '../pages/home/login_home.dart';
import '../pages/home/register_home.dart';
import 'package:chat/pages/chat/chat_chat.dart';
import 'package:chat/pages/chat/users_chat.dart';


Map<String, Widget Function(BuildContext)> mainRoutes = {

  '/loding'    : ( _ ) => const Loading(),
  '/login'    : ( _ ) => const LoginHome(),
  '/register' : ( _ ) => const RegisterHome(),
  '/chat'     : ( _ ) => const ChatChat(),
  '/users'    : ( _ ) => const UsersChat(),

};