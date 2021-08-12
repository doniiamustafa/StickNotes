import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_notes/add_note/add_note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sticky_notes/components/components.dart';
import 'package:sticky_notes/state_management/cubit.dart';
import 'package:sticky_notes/state_management/states.dart';
import 'package:sticky_notes/update_note/update_note.dart';

class StickyScreen extends StatelessWidget {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createDatabase().then((value) {
  //     database = value;
  //
  //     getNote(database: database).then((value) {
  //       list = value;
  //       setState(() {});
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // getNote(database: database).then((value) {
    //   list = value;
    //   print(value);
    //   setState(() {});
    //
    // });
    // CubitScreen.get(context).getNote(database: CubitScreen.get(context).database.toString() );
    var database =  CubitScreen.get(context).createDatabase();
    return BlocConsumer<CubitScreen , StatesModel>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          CubitScreen.get(context).getNote(database: database.toString());
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.indigoAccent,
              title: Text('Sticky Notes'),
              actions: [
                FlatButton(
                  textColor: Colors.white,
                  onPressed: () {
                    // deleteNote(database: database).then((value) {
                    //   setState(() {});
                    // });
                    CubitScreen.get(context).deleteNote(database: database.toString());
                  },
                  child: Text(
                    "DeleteAll".toUpperCase(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                  shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigatorTo(context: context, route: Add_Note(database: database));
              },
              child: Icon(
                Icons.add,
                size: 25.0,
              ),
            ),
            body: ConditionalBuilder(
              condition:  state is GetNotesState ,
              // condition: CubitScreen.get(context).list.length > 0,
              builder: (BuildContext context) => ListView.builder(
                itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      navigatorTo(
                          context: context,
                          route: Update_Note(
                            // database: database,
                            // title: list[index]['title'],
                            // descr: list[index]['descr'],
                            // id: list[index]['id'],
                            database: database,
                            title: CubitScreen.get(context).list[index]['title'],
                            descr: CubitScreen.get(context).list[index]['descr'],
                            id: CubitScreen.get(context).list[index]['id'],
                          ));
                    },
                    child: savedNotes(CubitScreen.get(context).list[index])),
                    itemCount: CubitScreen.get(context).list.length,
              ),
              fallback: (ctx) => Column(
                children: [
                  Image(
                    image: AssetImage('assets/2.png'),
                  ),
                  Text(
                    "No Notes Found, Let's Add Some!",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Center(child: CircularProgressIndicator()),

            ),

          );
        }
    );
  }

  Widget savedNotes(item) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  item['descr'],
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      );


}
