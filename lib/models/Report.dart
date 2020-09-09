import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uni/constants/api_constants.dart';

class Report{

    static reportComment(String commentId, String userId, String reason) async{
      var response = await http.post('$API_URL/report-comment', body: {
        "userId": userId,
        "reason": reason,
        "commentId": commentId
      });
      var data = jsonDecode(response.body);
      print(data);
    }

}