import 'package:eccomerce_app/app/api.routes.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final client = http.Client();

  Future getUser({required String token}) async {
    final http.Response response =
        await client.get(Uri.parse(ApiRoutes.userData), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Authorization": "$token"
    });
    return response.body;
  }
}
