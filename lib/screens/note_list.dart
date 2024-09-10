import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:note_keeper_app/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Add Appbar title
          navigationToNoteDetail('Add Note');
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                "Dummy Title",
                style: titleStyle,
              ),
              subtitle: Text("Dummy Date"),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                //Add Appbar title
                navigationToNoteDetail('Edit Note');
              },
            ),
          );
        });
  }

  void navigationToNoteDetail(String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteDetail(
                  appBarTitle: title,
                )));
  }
}
