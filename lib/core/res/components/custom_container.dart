import 'package:flutter/material.dart';



class CustomContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

   CustomContainer({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
    onTap: onTap,
      child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      ),
      child: Center(child: Text(title,style: TextStyle(fontSize: 17,color: Colors.black87,)),
    )
      ),
    );
  }
}
