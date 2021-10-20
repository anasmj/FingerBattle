import 'package:flutter/material.dart';
import 'package:finger_wrestling/main_page.dart';
import 'package:flutter/services.dart';
import 'providers/wrestle_provider.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> WrestleProvider()),
      ],
      child: const WrestleApp(),
    ),
  );
}


// void main (){
//   runApp(const WrestleApp());
//   SystemChrome.setEnabledSystemUIOverlays([]);///hides the status bar in entire app
//
// }



class WrestleApp extends StatelessWidget{
  const WrestleApp({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return  const MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: MainPage(),
    );
  }
}





