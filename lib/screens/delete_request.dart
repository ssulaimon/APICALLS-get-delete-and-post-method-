import 'dart:developer';

import 'package:api_call_simulation/models/getRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeleteRequest extends StatefulWidget {
  const DeleteRequest({Key? key}) : super(key: key);

  @override
  State<DeleteRequest> createState() => _DeleteRequestState();
}

class _DeleteRequestState extends State<DeleteRequest> {
  late TextEditingController id;
  @override
  void initState() {
    // TODO: implement initState
    id = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: id,
            decoration: const InputDecoration(hintText: 'ID'),
            keyboardType: TextInputType.number,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () async {
              if (id.text != null) {
                String reslut = await ApiRequest().deleteRequest(
                  id: id.text,
                );
                log(reslut);
              } else {
                log('Plese enter an ID');
              }
            },
            color: Colors.red,
            child: const Text('Delete Data'),
          )
        ],
      ),
    );
  }
}
