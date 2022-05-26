import 'package:flutter/material.dart';

import 'Post.dart';

//a page that allows the user to create a new post
class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Create a new post"),
          RaisedButton(
            child: Text("Create"),
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MyCustomForm(),
                ),
              );
              if (result is Post) {
                //TODO: add the new post to the list of posts
              }
            },
          )
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _spacer = SizedBox(height: 20);
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('create a new post'),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 4) {
                      return 'Please enter valid text';
                    }
                    return null;
                  },
                ),
                _spacer,
                TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'body',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description must have number';
                    }
                    return null;
                  },
                ),
                _spacer,
                submitButton(context)
              ],
            ),
          )),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Foreground color
        onPrimary: Theme.of(context).colorScheme.onPrimary,
        // Background color
        primary: Theme.of(context).colorScheme.primary,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Post released'),
            ),
          );
          Navigator.of(context).pop(
            Post(
              releaseDate: DateTime.now(),
            ),
          );
        }
      },
      child: const Text('Submit'),
    );
  }
}
