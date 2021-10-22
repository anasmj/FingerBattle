import 'package:finger_wrestling/providers/wrestle_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget{

  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
  SystemChrome.setEnabledSystemUIOverlays([]);

    final wrestleProvider = Provider.of<WrestleProvider>(context);
    final winnerColor = wrestleProvider.winnerColor;

    return Scaffold(
        body: Container(
          color: winnerColor ,
            child: Center(
              child: IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: (){
                    wrestleProvider.replay();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/main_page' );
                  }, iconSize: 80
              ),
            )
        )
    );
  }
}