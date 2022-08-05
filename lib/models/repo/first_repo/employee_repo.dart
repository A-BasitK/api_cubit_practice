import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../first_data_model/api_data_model.dart';

class Repo {
  static Future<List<Datum>?> getEmployeeData() async {
    //var request = http.Request('GET', Uri.parse("https://reqres.in/api/users?page=2"));

    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    // http.StreamedResponse response= await request.send();
    if (response.statusCode == 200) {
      print("response===> ${response.body}");

      var data = json.decode(response.body);

      var list = data['data'];
      print('======= data ${data["data"]}');
      //EmployeeData employeeData=EmployeeData.fromRawJson( response.body);

      final listOfData = <Datum>[];

      for (var items in list) {
        Datum datum = Datum.fromJson(items);

        listOfData.add(datum);
      }

      return listOfData;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
