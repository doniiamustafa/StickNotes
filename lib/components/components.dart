import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// //ha3mel function bt3mel return lel widgets eli bt3mel buttons zay el width w el color w text w kda
// Widget defaultButton(text, {padding = 35.0 , function}) => Padding(
//   padding: EdgeInsets.symmetric(horizontal: padding , ),
//   child: Container(
//     width: double.infinity,  // msh hynfa3 adelo width b 150 leh ???? 3lshan screen el mobilat a7gamha mokhtalefa mayenfa3sh asabet m2as fa ha3mel wrap padding
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0) , color: Colors.deepPurple[400]),
//     child: FlatButton(
//       onPressed: function,
//       child: Text('$text' , style: TextStyle(color: Colors.white , fontSize: 16.0),),
//     ),
//   ),
// );
void navigatorTo ({context , route}) => Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => route));