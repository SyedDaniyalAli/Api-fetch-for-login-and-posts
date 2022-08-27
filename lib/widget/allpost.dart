import 'package:flutter/material.dart';
import 'package:l0rem/Model/Providers/post.dart';
import 'package:l0rem/widget/new_post.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AllPost extends StatefulWidget {
  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  bool isLoading = false;

  void _startAddNew(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewPost();
      },
    );
  }

  @override
  void initState() {
    _getPosts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PostItem> data = Provider.of<Entry>(context, listen: true).items;

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: data.length,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.all(4),
                child: ListTile(
                  title: Text(
                    data[i].title,
                    style: TextStyle(
                        color: data[i].id == 'logedIn'
                            ? Theme.of(context).primaryColor
                            : Colors.black),
                  ),
                  subtitle: Text(
                    data[i].description,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ),
              separatorBuilder: (context, i) => Divider(),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNew(context), child: const Icon(Icons.add)),
    );
  }

  Future<List<PostItem>?> _getPosts(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var element in jsonResponse) {
        try {
          Provider.of<Entry>(context, listen: false).addNewPost(PostItem(
              id: element["id"].toString(),
              title: element["title"],
              description: element["body"]));
        } catch (e) {
          print(e);
        }

        // print('Response get by Emmad: ${element}');
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }
}
