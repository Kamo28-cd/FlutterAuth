import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidghet {
	final UserRepositories userRepositories;

	LoginScreen({Key key, @required this.userRepositories}) : assert (userRepositories != null),
	
	super (key: key);

	@override 
	Widget build(BuildContext context) {
		return Scaffold(
			body: BlocProvider(create: (context) {
				return LoginBloc(userRepositories: uuserRepositories, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
			},
			child: ,
			), // BlocProvider
		); // Scaffold
		
	},
	
}