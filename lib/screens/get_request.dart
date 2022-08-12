import 'package:api_call_simulation/models/data.dart';
import 'package:api_call_simulation/models/getRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetRequest extends StatefulWidget {
  const GetRequest({Key? key}) : super(key: key);

  @override
  State<GetRequest> createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {
  ApiRequest apiRequest = ApiRequest();
  TextEditingController? chooseId;
  String? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chooseId = TextEditingController();
  }

  @override
  void dispose() {
    chooseId!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: chooseId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Enter and ID',
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.done))),
            ),
            FutureBuilder<Data?>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Data data = snapshot.data!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            value = data.title;
                          });
                        },
                        child: const Text(
                          'Get title',
                        ),
                      ),
                      FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            value = data.completed.toString();
                          });
                        },
                        child: const Text(
                          'Get completed',
                        ),
                      ),
                      FlatButton(
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            value = data.id.toString();
                          });
                        },
                        child: const Text(
                          'Get userID',
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('Please select an ID');
                }
              },
              future: apiRequest.apiRequest(
                id: chooseId!.text,
              ),
            ),
            value == null ? const Text('') : Text(value!),
          ],
        ),
      ),
    );
  }
}
