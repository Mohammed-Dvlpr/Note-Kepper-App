import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['Hight', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDowmStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDowmStringItem,
                    child: Text(dropDowmStringItem),
                  );
                }).toList(),
                style: textStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint("User Selected Item $valueSelectedByUser");
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("domthig ");
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark),
                    onPressed: () {
                      setState(() {
                        debugPrint("Button Pressed");
                      });
                    },
                    child: Text(
                      'Save',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  )),
                  SizedBox(width: 5.0),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark),
                    onPressed: () {
                      setState(() {
                        debugPrint("Button Pressed");
                      });
                    },
                    child: Text(
                      'Delete',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
