import 'package:finger_wrestling/providers/wrestle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build (BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
    final wrestleProvider = Provider.of<WrestleProvider>(context);
    wrestleProvider.screenHeight = MediaQuery.of(context).size.height;

    if(wrestleProvider.topContainerHeight == wrestleProvider.screenHeight){
      print('A win');

    }else if(wrestleProvider.topContainerHeight ==0){
      print('B win');
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              wrestleProvider.increaseTopHeight();
            },
            child: Container(
              color: Colors.blue,
              height: wrestleProvider.topContainerHeight ,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                wrestleProvider.decreaseTopHeight();
              },
              child: Container(
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),


    );
  }
}



// import 'package:finger_wrestling/providers/wrestle_provider.dart';
// import 'package:provider/provider.dart';


// class  MainPage extends StatefulWidget{
//   const MainPage({Key? key}) : super(key: key);
// @override
//   State<StatefulWidget> createState() => MainPageState();
// }
// class MainPageState extends State<MainPage>{
//   late double _screenHeight;
//   double divisor = 2;
//
//   @override
//   Widget build (BuildContext context){
//     _screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           GestureDetector(
//            onTap: (){
//              setState(() {
//                if(divisor == 0 ){
//                  divisor = 0.1;
//                }
//                 divisor -= 0.3;
//               });
//             },
//             child: Container(
//               color:Colors.blue,
//               height: _screenHeight / divisor,
//             )
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: (){
//                 setState(() {
//                   divisor += .3;
//                 });
//               },
//               child: Container(
//                 color: Colors.teal,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }