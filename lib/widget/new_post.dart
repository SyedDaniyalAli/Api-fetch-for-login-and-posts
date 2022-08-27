import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/post.dart';
import 'package:provider/provider.dart';

class NewPost extends StatefulWidget {
  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _newEntry = PostItem(
    id: "logedIn",
    title: "",
    description: "",
  );

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Entry>(context, listen: false).insertNewPost(_newEntry);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _form,
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    onSaved: (value) {
                      _newEntry = PostItem(
                          id: _newEntry.id,
                          title: value.toString(),
                          description: _newEntry.description);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please provide a value.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSaved: (value) {
                      _newEntry = PostItem(
                          id: _newEntry.id,
                          title: _newEntry.title,
                          description: value.toString());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description.';
                      }
                      if (value.length <= 10) {
                        return 'Should be at least 10 characters long.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: _saveForm,
                    child: const Text('Add Post'),
                    textColor: Theme.of(context).textTheme.button!.color,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
