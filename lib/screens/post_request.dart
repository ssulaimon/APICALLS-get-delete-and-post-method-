import 'dart:developer';

import 'package:api_call_simulation/models/getRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostRequest extends StatefulWidget {
  const PostRequest({Key? key}) : super(key: key);

  @override
  State<PostRequest> createState() => _PostRequestState();
}

class _PostRequestState extends State<PostRequest> {
  TextEditingController? body;
  late TextEditingController userId;
  TextEditingController? title;
  @override
  void initState() {
    // TODO: implement initState
    body = TextEditingController();
    userId = TextEditingController();
    title = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    body!.dispose();
    userId.dispose();
    title!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: body,
            decoration: const InputDecoration(hintText: 'Body'),
          ),
          TextField(
            controller: title,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: userId,
            decoration: const InputDecoration(hintText: 'UserID'),
            keyboardType: TextInputType.number,
          ),
          FlatButton(
            onPressed: () async {
              if (userId.text != null) {
                var apiRequest = await ApiRequest().postDataRequest(
                  userId: int.parse(userId.text),
                  body: body!.text,
                  title: title!.text,
                );
                log(
                  apiRequest.toString(),
                );
              } else {
                log('please enter a userID');
              }
            },
            color: Colors.green,
            child: const Text('Post Data'),
          )
        ],
      ),
    );
  }
}
