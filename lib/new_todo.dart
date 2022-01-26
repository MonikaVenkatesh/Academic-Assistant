import 'package:flutter/material.dart';
import 'package:academic_assistant/todo.dart';

class NewTodoView extends StatefulWidget {
  final Todo item;

  NewTodoView({ this.item });

  @override
  _NewTodoViewState createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          widget.item != null ? 'Edit todo' : 'New task',
          key: Key('new-item-title'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*TextField(
              //decoration: InputDecoration(border: OutlineInputBorder()),
              decoration: InputDecoration(hintText: 'Remind what',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.purple[800],
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.purple[100],
                    width: 2.0,
                  ),
                ),),
            ),*/
            TextField(
              controller: titleController,
              autofocus: true,
              onEditingComplete: submit,
              decoration: InputDecoration(fillColor:Colors.purple[800],labelText: 'Title'),
            ),
            SizedBox(height: 14.0,),
            RaisedButton(
              color: Colors.purple[800],//Theme.of(context).primaryColor,
              child: Text(
                'Save',
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color
                ),
              ),
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)
                  )
              ),
              onPressed: () => submit(),
            )
          ],
        ),
      ),
    );
  }

  void submit(){
    Navigator.of(context).pop(titleController.text);
  }
}