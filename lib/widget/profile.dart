import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/data.dart';
import 'package:l0rem/widget/new_profile.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
      body: ListView.separated(
          itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Name'),
                      Text(item[index].name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Username'),
                      Text(item[index].userName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Address'),
                      Text(item[index].address),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Zipcode'),
                      Text(item[index].zipcode.toString()),
                    ],
                  ),
                ],
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: item.length),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNew(context), child: const Icon(Icons.add)),
    );
  }
}
