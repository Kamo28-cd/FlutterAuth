import 'package:flutter/material.dart';

class SimpleBlocDelegate extends BlocDelegate {
	@override
	void onEvent(Bloc bloc, Object event) {
		super.onEvent(bloc, event);
	}

	@override
	void onTransition(Bloc bloc, Transition transiton) {
		super.onTransition(bloc, transition);
	}

	@override
	void onError(Bloc bloc, Object error, StackTrace stackTrace) {
		super.onError(bloc, error, stackTrace);
	}
}

void main() {
	BlocSupervisor.delegate = SimpleBlocDelegate();
	final UserRepositories userRepositories = UserRepositories();
	runApp(
		BlocProvider(create: (context) {
			return AuthenticationBloc(userRepositories: userRepositories)..add(AppStarted());
		},
		child: MyApp(),
		}) // BlocProvider
	);
}

class MyApp extends StatelessWidget {
	final UserRepositories userRepositories;
	
	MyApp({Key key, @required this.userRepositories}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			home: BlocBuilder<AuthenticationBloc, AuthenticationState>(builder: (context, state){
				if(state is AuthenticationAuthenticated) {
					return MainScreen();
				}
				if(state is AuthenticationUnauthenticated) {
					return IntroPAge(userRepositories: userRepositories);
				}
				if(state is AuthenticationLoading) {
					return Scaffold(
						body: CircularProgressIndicator(),
					); // Scaffold 
				}
				return Scaffold(
						body: CircularProgressIndicator(),
					); // Scaffold 
			}), // BlocBuilder
		); // MaterialApp
	}
}