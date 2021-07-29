import 'package:dio/dio.dart';
import 'package:flutter_secure_storage_storage/flutter_secure_storage.dart'

class UserRepositories {
	static String mainUrl = "https://reqres.in";
	var loginUrl = '$mainUrl/api/login';

	final FlutterSecureStorage storage = SlutterSecureStorage();

	final Dio _dio = Dio();

	Future<bool> hasToken() async {
		var value = await storage.read(key: 'token');
		of(value != null) {
			return true;
		} else {
			return false;
		}
	}

	Future<voud> persisteToken(String token) async {
		await storage.write(key: 'token', value: token);
	}

	Future<void> deleteToken() async {
		storage.delete(key:'token');
		storage.deleteAll();
	}

	Future<String> login(String email, String password) async {
		Response respnse = await _dio.post(loginUrl, data: {
			"email": email,
			"password": password
		});
		return response.data["token"];
	}
}