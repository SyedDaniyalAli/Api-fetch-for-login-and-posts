import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/data.dart';
import 'package:provider/provider.dart';

class NewProfile extends StatefulWidget {
  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final _form = GlobalKey<FormState>();
  var _newProfile =
      UserData(id: '', name: '', userName: '', address: '', zipcode: '');

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<NewCandidate>(context, listen: false).addNew(_newProfile);
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
                    decoration: InputDecoration(labelText: 'Name'),
                    onSaved: (value) {
                      _newProfile = UserData(
                          id: _newProfile.id,
                          name: value.toString(),
                          userName: _newProfile.userName,
                          address: _newProfile.address,
                          zipcode: _newProfile.zipcode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please provide a name.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSaved: (value) {
                      _newProfile = UserData(
                          id: _newProfile.id,
                          name: _newProfile.name,
                          userName: value.toString(),
                          address: _newProfile.address,
                          zipcode: _newProfile.zipcode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please provide a username.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'address'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSaved: (value) {
                      _newProfile = UserData(
                          id: _newProfile.id,
                          name: _newProfile.name,
                          userName: _newProfile.userName,
                          address: value.toString(),
                          zipcode: _newProfile.zipcode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please provide a address.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Zipcode'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSaved: (value) {
                      _newProfile = UserData(
                          id: _newProfile.id,
                          name: _newProfile.name,
                          userName: _newProfile.userName,
                          address: _newProfile.address,
                          zipcode: value.toString());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please provide a username.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: _saveForm,
                    child: Text('Add Profile'),
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
