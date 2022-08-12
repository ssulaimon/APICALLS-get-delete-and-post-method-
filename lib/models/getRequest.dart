import 'dart:convert';

import 'package:api_call_simulation/models/data.dart';
import 'package:http/http.dart';

class ApiRequest {
  Future<Data?> apiRequest({required String id}) async {
    String url = 'https://jsonplaceholder.typicode.com/todos/$id';
    var uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      if (response.statusCode == 200) {
        Map map = await jsonDecode(response.body);
        return Data.getRequest(json: map);
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> postDataRequest({
    required int userId,
    required String body,
    required String title,
  }) async {
    try {
      Data data = Data(userId: userId, body: body, title: title);
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      Response response = await post(
        uri,
        body: jsonEncode(
          data.toJson(),
        ),
      );
      if (response.statusCode == 201) {
        return 'Data Posted';
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> deleteRequest({required String id}) async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
      Response request = await delete(uri);
      if (request.statusCode == 200) {
        return 'Data deleted';
      } else {
        return 'Error${request.statusCode.toString()}';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
