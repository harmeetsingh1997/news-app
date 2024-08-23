

import 'package:flutter/material.dart';

class NewsDetailedScreen extends StatelessWidget {

  final String url;
  final String caption;
  final String detailed;
  const NewsDetailedScreen({super.key, required this.url,required this.caption, required this.detailed});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.transparent,
        ),
        body:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
               Text(
                   caption,
                 style: const TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                   color:Colors.black,
                 ),


               ),
              Image.network(url),
             const  SizedBox(
                height: 25,
              ),
               Text(
                detailed,
              style: const  TextStyle(
                fontWeight: FontWeight.bold,
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
