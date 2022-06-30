import 'package:chat/pages/home/widgets/info_banner.dart';
import 'package:chat/widgets/botom._widget.dart';
import 'package:chat/widgets/custom_input_widget.dart';
import 'package:chat/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class RegisterHome extends StatelessWidget {
  const RegisterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            margin:const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Center(
                  child: Container(
                    margin:const EdgeInsets.only(top:50.0,bottom: 0.0),
                    width: 170,
                    child: Image.asset(
                      'assets/smiley.png',
                    ),
                  ),
                ),
                _Form(),
                const InfoBannerWidget(
                  route: '/login',
                  titlePrimary: 'Inicia Sesión',
                  titleSecundary: '¿Ya tienes cuenta?',
                ),
                CustomTextWidget(title:'Terminos y Condiciones'),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class _Form extends StatelessWidget {
  final _namelCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  _Form({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 0,left: 20,right: 20),
      child: Form(
        child: Column(
          children:[
            CustomInputWidget(
              controller: _namelCtrl, 
              icon: Icons.person_pin_outlined,
              placeholder: 'Nombre',
            ),
            CustomInputWidget(
              controller: _emailCtrl, 
              icon: Icons.email_outlined,
              placeholder: 'Correo',
              textInputType: TextInputType.emailAddress,
            ),
            CustomInputWidget(
              controller: _telCtrl, 
              icon: Icons.phone_android_sharp,
              placeholder: 'Teléfono',
              textInputType: TextInputType.phone,
            ),
            CustomInputWidget(
              isPassword: true,
              controller: _passCtrl, 

              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textInputType: TextInputType.visiblePassword,
            ),
            CustomButtomWidget(
              title: 'Regístrarse',
              callbackAction:() {
                
              },
            ),
          ],
        )
      ),
    );
  }
}

