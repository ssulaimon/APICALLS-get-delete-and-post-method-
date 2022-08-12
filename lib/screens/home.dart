import 'package:api_call_simulation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Api calls '),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, postRequest);
              },
              color: Colors.green,
              child: const Text('Post request'),
            ),
            FlatButton(
              onPressed: () => navigation(
                context: context,
                route: getRequest,
              ),
              color: Colors.blue,
              child: const Text('Get request'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, deleteRequest);
              },
              color: Colors.red,
              child: const Text('Delete request'),
            )
          ],
        ),
      ),
    );
  }
}

void navigation({required BuildContext context, required String route}) {
  Navigator.pushNamed(context, route);
}
