import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/data.dart';
import 'package:l0rem/widget/new_profile.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    void _startAddNew(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewProfile();
        },
      );
    }

    List<UserData> item =
        Provider.of<NewCandidate>(context, listen: true).items;

    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            item[index].name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            item[index].userName,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            item[index].address,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            'Zipcode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            item[index].zipcode,
                            style: TextStyle(fontSize: 20),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          itemCount: item.length),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNew(context), child: const Icon(Icons.add)),
    );
  }
}
