import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_notes/components/components.dart';
import 'package:sticky_notes/state_management/cubit.dart';
import 'package:sticky_notes/state_management/states.dart';
import 'package:sticky_notes/sticky_screen/sticky.dart';

class Add_Note extends StatefulWidget {
  var database;

  Add_Note({this.database});

  @override
  _Add_NoteState createState() => _Add_NoteState();
}

class _Add_NoteState extends State<Add_Note> {
  var titleController = TextEditingController();

  var descrController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CubitScreen , StatesModel>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text('AddNoteActivity'),
          // leading: Icon(
          //   Icons.arrow_back,
          // ),
          // actions: [
          //   IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: (){Navigator.pop(context);}),
          // ],

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      )),
                ),

                //SizedBox(height: 10.0,),

                TextFormField(
                  controller: descrController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                    // border: InputBorder.none,
                    // floatingLabelBehavior: FloatingLabelBehavior.always,

                    // hintText: 'Description' ,hintStyle: TextStyle(fontSize: 20.0 ,) ,
                    // MaxLines: 300,
                    // contentPadding: new EdgeInsets.only(bottom: 450.0),
                  ),
                ),
                // SizedBox(height: 10.0,),
                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: 150.0 ,),
                //   child: Container(
                //        color: Colors.grey,
                //       width: double.infinity,
                //       child: Center(child: FlatButton(onPressed: ()
                //       {
                //         Navigator.pop(context);
                //       }, child: Text('Save'.toUpperCase(),style: TextStyle( fontSize: 16.0),)))
                //   ),
                // ),
                Center(
                    child: RaisedButton(
                      onPressed: () {
                        String title = titleController.text;
                        String descr = descrController.text;

                        CubitScreen.get(context).insertNote(database: widget.database , title: title  , descr: descr).then((value){
                          Navigator.pop(context);
                          // navigatorTo(context: context , route: StickyScreen());
                          print('note inserted');
                        });


                      },
                      child: Text('Save'.toUpperCase(),
                          style: TextStyle(fontSize: 16.0)),
                      color: Colors.grey[500],
                    )),
              ],
            ),
          ),
        ),
      ),

    );
  }


}
