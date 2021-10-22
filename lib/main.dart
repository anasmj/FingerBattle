import 'package:flutter/material.dart';
import 'package:finger_wrestling/pages/main_page.dart';
import 'providers/wrestle_provider.dart';
import 'package:provider/provider.dart';
import 'package:finger_wrestling/pages/score_page.dart';

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

class WrestleApp extends StatelessWidget{
  const WrestleApp({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return   MaterialApp(
      debugShowCheckedModeBanner:  false,
      //home: MainPage(),
       initialRoute: '/main_page',
      routes: {
        '/main_page' : (context) => const MainPage(),
        '/score_page': (context) => const ScorePage(),
      }
    );
  }
}





