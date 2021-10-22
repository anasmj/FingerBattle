import 'dart:math';
import 'package:finger_wrestling/providers/wrestle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
const MainPage({Key? key}) : super (key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  late Color topColor;
  late Color bottomColor;

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
  @override
  void initState() {
    topColor = generateColor();
    bottomColor = generateColor();
    super.initState();
  }

  @override
  Widget build (BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
    final wrestleProvider = Provider.of<WrestleProvider>(context);
    wrestleProvider.screenHeight = MediaQuery.of(context).size.height;

    if(wrestleProvider.topContainerHeight == wrestleProvider.screenHeight){
      wrestleProvider.winnerColor = topColor;

      WidgetsBinding.instance!.addPostFrameCallback((_){
        Navigator.pushNamed(context,'/score_page');
      });

    }else if(wrestleProvider.topContainerHeight ==0){
      wrestleProvider.winnerColor = bottomColor;

      WidgetsBinding.instance!.addPostFrameCallback((_){
        Navigator.pushReplacementNamed(context,'/score_page');
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Provider.of<WrestleProvider>(context, listen: false).increaseTopHeight();
            },
            child: Container(
              color: topColor,
              height: wrestleProvider.topContainerHeight ,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Provider.of<WrestleProvider>(context, listen: false).decreaseTopHeight();
                //wrestleProvider.decreaseTopHeight();
              },
              child: Container(
                color: bottomColor,
              ),
            ),
          ),
        ],
      ),


    );
  }
}
