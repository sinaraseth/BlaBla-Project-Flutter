import 'package:http/http.dart' as http;
 
 class PostDto {
   final Uri link;
 
   PostDto({required this.link});
 
   Future<String> getHttp() async {
     final response = await http.get(link);
     return response.body;
   }
 }