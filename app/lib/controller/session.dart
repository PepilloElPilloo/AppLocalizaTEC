import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Session {

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    
    final String baseUrl = 'http://10.0.2.2:3000';


    Future<http.Response> get(String url) async {
      final SharedPreferences prefs = await _prefs;
      final authToken = prefs.getString('auth_token');
      final response = await http.get(Uri.parse( '$baseUrl$url' ), headers: { 
        'auth-token': authToken ?? '',
      } );
      
      return response;
    }

    Future<http.Response> post(String url, dynamic data) async {
      final SharedPreferences prefs = await _prefs;
      final authToken = prefs.getString('auth_token');
      final response = await http.post(Uri.parse(' $baseUrl$url '), body: data, headers: { 
        'auth-token': authToken ?? '',
      } );
      
      return response;
    }

    Future<void> storeAuthToken(String token) async {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('auth_token', token);
    }

    Future<String?> retrieveAuthToken() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('auth_token');
    }
}
