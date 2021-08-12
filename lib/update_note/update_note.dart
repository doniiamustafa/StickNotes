import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_notes/state_management/cubit.dart';

class Update_Note extends StatelessWidget {
  var titleController = TextEditingController();
  var descrController = TextEditingController();
  String title;
  String descr;
  int id;
  var database;


  Update_Note({this.database,this.title, this.descr , this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
   titleController.text = title;
   descrController.text = descr;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Update Note'),
        leading: Icon(Icons.arrow_back_ios_outlined),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Text("Delete".toUpperCase() , style: TextStyle(fontSize: 16.0),),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title' ,hintStyle: TextStyle(fontSize: 20.0 ,) ),
              ),

              SizedBox(height: 10.0,),

              TextFormField(
                controller: descrController,
                decoration: InputDecoration(
                  hintText: 'Description' ,hintStyle: TextStyle(fontSize: 20.0 ,) ,
                  contentPadding: new EdgeInsets.only(bottom: 450.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 150.0 ,),
                child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    child: Center(child: FlatButton(onPressed: (){

                      CubitScreen.get(context).updateNote(database: database , title: titleController.text , descr: descrController.text , id: id).then((value) {
                      Navigator.pop(context); });

                    }, child: Text('update'.toUpperCase(),style: TextStyle( fontSize: 16.0),)))
                ),
              ),
            ],

          ),
        ),

      ),
    );
  }


}
