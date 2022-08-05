import 'dart:convert';

import '../../second_data_model/staff_data_model.dart';
import 'package:http/http.dart' as http;

class Repo2 {
 static Future<List<StaffData>?> getStaffData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    print(response.statusCode);
    if (response.statusCode == 200) {
       var data = json.decode(response.body);


      final listOfData = <StaffData>[];


      for(var items in data){
        StaffData staffData = StaffData.fromJson(items);

        listOfData.add(staffData);
      }


      print("response===> ${response.body}");

      return listOfData;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
