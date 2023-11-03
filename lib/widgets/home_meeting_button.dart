import 'package:flutter/material.dart';
import 'package:zoom_copy/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const HomeMeetingButton({Key? key, required this.onPressed, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow:[
                BoxShadow(
                    color: Colors.black.withOpacity(.06),
                    blurRadius:10,offset:Offset(4,0) )] ),
          child: Icon(icon,color: Colors.white,size: 30,),
        ),
        const SizedBox(height: 5,),
        Text(text,style: const TextStyle(color: Colors.grey),)
      ],),
    );
  }
}
