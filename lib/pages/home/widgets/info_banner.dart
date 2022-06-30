import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_text_widget.dart';


class InfoBannerWidget extends StatelessWidget {
  final String? titlePrimary;
  final String? titleSecundary;
  final String route;

  const InfoBannerWidget({ 
    Key? key, 
    required this.titlePrimary, 
    required this.titleSecundary, 
    required this.route 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin:const EdgeInsets.only(top: 20,left: 20,right: 20),
       child: Column(
        children: [
          CustomTextWidget(title: titleSecundary),
          const SizedBox(height: 5),
          GestureDetector(
            child: CustomTextWidget(title: titlePrimary,type: 'secundary',),
            onTap: (){
              Navigator.pushReplacementNamed(context, route);
            },
          ),
          const SizedBox(height: 20,)
        ],
       ),
    );
  }
}