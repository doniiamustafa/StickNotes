import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sticky_notes/add_note/add_note.dart';
import 'package:sticky_notes/components/components.dart';
import 'package:sticky_notes/state_management/states.dart';
import 'package:sticky_notes/sticky_screen/sticky.dart';

class CubitScreen extends Cubit<StatesModel>
{
  CubitScreen() : super(InitialNotesStates());
  static CubitScreen get(context) => BlocProvider.of(context);

  List list = [];

  Future<Database> createDatabase() async {
    return await openDatabase(
      'NotesDB',
      version: 1,
      onCreate: (db, version) async {
        print('Database created');
        emit(CreateNotesStates());
        await db
            .execute(
            'CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, descr text)')
            .then((value) => print('Table Created'));

      },
      onOpen: (db) {
        print('Database opened');
      },
    );
  }

  Future<void> insertNote(
      { @required database,String title, String descr}) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO notes(title , descr) VALUES("$title", "$descr")').then((value){
            // navigatorTo(context: Add_Note(database: database,) , route: StickyScreen());
           print('donee');
            emit(AddNotesState());

      });
    });
  }

  Future<List<Map>> getNote({@required database}) async {
    return await database.rawQuery('SELECT * FROM notes').then((value) {
      list = value;
      print(value);
      emit(GetNotesState());

    });
  }

  Future<void> updateNote({@required database , String title , String descr , int id}) async {
    print('stop');
    return await database.rawUpdate(
        'UPDATE notes SET title = ?, descr = ? WHERE id = ?',
        ["$title", "$descr", id ]).then((value){
          emit(UpdateNotesState());
    });
  }

  Future<void> deleteNote({@required database}) async {
    return await database.rawDelete('DELETE FROM notes').then((value) {
      emit(DeleteNotesStates());
    });
  }
}