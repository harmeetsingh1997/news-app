
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_bloc.dart';
import 'package:news_app/Screens/starting_screen.dart';
import 'package:news_app/core/service_locator.dart';


void main(){

  setupServiceLocator();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> sl<NewsBloc>(),
      child: const  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartingScreen(),
      ),
    );
  }
}
