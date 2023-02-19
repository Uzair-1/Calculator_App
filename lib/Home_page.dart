import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Componets/my_button.dart';
import 'package:animated_radial_menu/animated_radial_menu.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  var userInput='';
  var answer='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child:Container(
                      height:240,
                      decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        color: Colors.white24,
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),

                          ),
                          SizedBox(height: 15,),
                          Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                 child:  Column(
                   children: [
                     Row(
                       children: [
                         MyButton(title: 'AC',onpress: (){
                           userInput='';
                           answer='';
                           setState(() {

                           });
                         },),
                         MyButton(title: '+/-',onpress: (){
                           userInput+='+/-';
                           setState(() {

                           });
                         },),
                         MyButton(title: '%',onpress: (){
                           userInput+='%';
                           setState(() {

                           });
                         }),
                         MyButton(title: '/',onpress: (){
                           userInput+='/';
                           setState(() {

                           });
                         },color: Color(0xffffa00a),),

                       ],
                     ),

                     Row(
                       children: [
                         MyButton(title: '7',onpress: (){
                          userInput+='7';
                          setState(() {

                          });
                         },color: Colors.white24,),
                         MyButton(title: '8',onpress: (){
                           userInput+='8';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '9',onpress: (){
                           userInput+='9';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: 'x',onpress: (){
                           userInput+='x';
                           setState(() {

                           });
                         },color: Color(0xffffa00a),),

                       ],
                     ),

                     Row(
                       children: [
                         MyButton(title: '4',onpress: (){
                           userInput+='4';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '5',onpress: (){
                           userInput+='5';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '6',onpress: (){
                           userInput+='6';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '-',onpress: (){
                           userInput+='-';
                           setState(() {

                           });
                         },color: Color(0xffffa00a),),

                       ],
                     ),
                     Row(
                       children: [
                         MyButton(title: '1',onpress: (){
                           userInput+='1';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '2',onpress: (){
                           userInput+='2';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '3',onpress: (){
                           userInput+='3';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '+',onpress: (){
                           userInput+='+';
                           setState(() {

                           });
                         },color: Color(0xffffa00a),),

                       ],
                     ),
                     Row(
                       children: [
                         MyButton(title: '0',onpress: (){
                           userInput+='0';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: '.',onpress: (){
                           userInput+='.';
                           setState(() {

                           });
                         },color: Colors.white24),
                         MyButton(title: 'DEL',onpress: (){
                           userInput=userInput.substring(0,userInput.length-1);
                           setState(() {

                           });
                         },color: Colors.white24,),
                         MyButton(title: '=',onpress: (){
                           Equalpress();
                           setState(() {

                           });
                         },color: Color(0xffffa00a),),

                       ],
                     ),
                     SizedBox(height: 10,),
                   ],
                 ),
               ),

              ],

            ),
          ),

        ),


      );
  }


void Equalpress()
{

  String finaluserInput=userInput;
  finaluserInput=userInput.replaceAll('x', '*');
  Parser p=Parser();
  Expression expression= p.parse(finaluserInput);
  ContextModel contextModel=ContextModel();

  double eval=expression.evaluate(EvaluationType.REAL, contextModel);
  answer=eval.toString();
}

}



