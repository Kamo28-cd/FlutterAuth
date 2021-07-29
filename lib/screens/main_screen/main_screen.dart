import 'package:authwithrest/bloc/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:authwithrest/style/theme.dart' as Style;
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
	@override
	_MainScreenState createState() => _MainScreenState();
}

class _MainSCreenState extends State<MainScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Style.Colors.mainColor,
				leading: CircleAvatar(
					padding: const EdgeInsets.all(10.0),
					child: CircleAvatar(
						backgroundImage: NetworkImage(
							"https://unsplash.com/photos/FsXq3xu72bs"
						) // NetworkImage
							
					), // CircleAvatar
				), // Padding
				title: Text("Main Page"),
				actions: [
					IconButton(icon: Icon(EvaIcons.logOutline), onPressed: () {
						BlocProvider.of<AuthenticationBloc>(context).add(
							LoggedOut
						);	
					})	// IconButton	
				],			
				
			), // AppBar
		); // Scaffold
	}
}

