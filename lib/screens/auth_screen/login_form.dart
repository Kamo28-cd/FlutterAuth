import 'package:authwithrest/bloc/login_bloc/login_bloc.dart';
import 'package:authwithrest/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package: flutter_bloc/flutter_bloc.dart';
import 'package:authwithrest/style/theme.dart' as Style;


class LoginForm extends StatefulWidget {

	final UserRepositories userRepositories;
	LoginForm({Key key, @required this.userRepositories})
	:assert(userRepositories != null),
	super(key: key);

	@override
	_LoginFormState createState() => _LoginFormState(userRepositories);

}

class _LoginFormState extends State<LoginForm> {
	final UserRepositories userRepositories;
	_LoginFormState(this.userRepositories);
	
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();
	
	@override
	Widget build(BuildContext context) {
		_onLoginButtonPressed() {
			BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
				email: _emailController.text,
				password: _passwordController.text
			));
		}
		
		return BlocListener<LoginBloc, LoginState>(
			listener: (context, state) {
				if(state is LoginFailure) {
					Scaffold.of(context).showSnackBar(
						SnackBar(context: Text('Login Failed...'))
						backgroundColor: Colors.red
					) // SnackBar
				};
			},
			child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
				return Padding(padding: EdgeInsets.only(
					right: 20.0,
					left: 20.0,
					top: 80.0
				), // EdgeInsets.only
				child: Form(
					child: Column(
						children: [
							Container(
								height:200.0,
								padding: EdgeInsets.only(
									bottom: 20.0,
									top:40.0
								), // EdgeInsets.only
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Text("Buy Anything you need", style: TextStyle(
											color: Style.Colors.mainColor,
											fontWeight: FontWeight.bold,
											fontSize: 24.0
										),), // TextStyle //Text
										SizedBox(
											height: 5.0,
										), // SizedBox
										Text('Login to start get started', style: TextStyle(
											fontSize: 10.0,
											color: Colors.black38
										),) // TextStyle //Text
									],
								), // Column	
							), // Container
							SizedBox(
								height: 30.0 
							), // SizedBox
							TextFormField(
								style: TextStyle(
									fontSize: 14.0,
									color: Colors.black54,
									fontWeight: FontWeight.bold	
								), // TextStyle
								controller: _emailController,
								decoration: InputDecoration(
									prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.black26,),
									enabledBorder: OutlineInputBorder(
										borderSide: BorderSide(
											color: Colors.black12
										), // BorderSide
										borderRadius: BorderRadius.circular(30.0)
									), // OutlineInputBorder
									focusedBorder: OutlineInputBorder(
										borderSide: BorderSide(
											color: Style.Colors.mainColor
										), // BorderSide
										borderRadius: BorderRadius.circular(30.0)
									), // OutlineInputBorder
									contentPadding: EdgeInsets.only(
										left: 10.0, right: 10.0
									), // EdgeInsets.only
									labelText: 'E-Mail',
									labelStyle: TextStyle(
										fontSize: 12.0,
										color: Colors.grey,
										fontWeiht: FontWeight.w500
									) // TextStyle 
								), // InputDecoration	
							),// TextFormField
							SizedBox(
								height: 20.0,
							), // SizedBox
							TextFormField(
								style: TextStyle(
									fontSize: 14.0,
									color: Colors.black54,
									fontWeight: FontWeight.bold	
								), // TextStyle
								controller: _passwordController,
								decoration: InputDecoration(
									prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.black26,),
									enabledBorder: OutlineInputBorder(
										borderSide: BorderSide(
											color: Colors.black12
										), // BorderSide
										borderRadius: BorderRadius.circular(30.0)
									), // OutlineInputBorder
									focusedBorder: OutlineInputBorder(
										borderSide: BorderSide(
											color: Style.Colors.mainColor
										), // BorderSide
										borderRadius: BorderRadius.circular(30.0)
									), // OutlineInputBorder
									contentPadding: EdgeInsets.only(
										left: 10.0, right: 10.0
									), // EdgeInsets.only
									labelText: 'Password',
									labelStyle: TextStyle(
										fontSize: 12.0,
										color: Colors.grey,
										fontWeiht: FontWeight.w500
									) // TextStyle
									 
								), // InputDecoration
								obscureText: true,	
							), // TextFormField
							SizedBox(
								height: 30.0,
							), // SizedBox
							Align(
								alignment:Alignment.centerRight,
								child: InkWell(
									child: Text('Forgot Your Password?', style: TextStyle(
										color: Colors.black45,
										fontSize: 12.0
									),), // TextStyle //Text
									onTap: () {},
								), // Inkwell
							), // Align
							Padding(padding: EdgeInsets.only(
								top: 30.0,
								bottom: 20.0
							), // EdgeInsets.only
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									SizedBox(
										height: 45.0,
										child: state is LoginLoading ?
										Column(
											crossAxisAlignment: CrossAxisAlignment.center,
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												Center
													child: Column(
														children: [
															SizedBox(
																height: 25.0,
																width: 25.0,
																child: CupertinoActivityIndicatior(),
															) // SizedBox
														],
													), // Column
												) // Center
											],
										) : RaisedButton( // Column
											onPressed: _onLoginButtonPressed,
											color: Style.Colors.mainColor,
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(30.0)
											), // RoundedRectangleBorder
											child: Text('Log In', style: TextStyle(
												fontSize: 12.0,
												fontWeight: FontWeight.bold,
												color: Colors.white
												
											),), // TextStyle // Text
										), // RaisedButton
										
									) // SizedBox
								],
							), //Column
							), Padding
							Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text("Or connect using", style: TextStyle(
										color: Colors.black26,
										fontSize: 12.0
									),) // TextStyle // Text
								],
							
							), // Row
							SizedBox(
								height: 20.0,	
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									Container(
										height: 40.0,
										width: 180.0,
										child: RaisedButton(onPressed: () {},
										color: Color(0xFF385C8E),
										shape: RoundedRectangularBorder(
											borderRadius: BorderRadius.circular(8.0)
										), // RoundedRectangleBorder
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												Icon(EvaIcons.facebook, color: Colors.white),
												SizedBox(
													width: 5.0,
												), // SizedBox
												Text('facebook', style: TextStyle(
													fontSize: 12.0,
													fontWeight: FontWeight.bold,
													color: Colors.white
												),) //TextStyle //Text
											],
										), // Row
										), // RaisedButton
									), // Container
									Container(
										height: 40.0,
										width: 180.0,
										child: RaisedButton(onPressed: () {},
										color: Color(0xFFF14436),
										shape: RoundedRectangularBorder(
											borderRadius: BorderRadius.circular(8.0)
										), // RoundedRectangleBorder
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												Icon(EvaIcons.google, color: Colors.white),
												SizedBox(
													width: 5.0,
												), // SizedBox
												Text('google', style: TextStyle(
													fontSize: 12.0,
													fontWeight: FontWeight.bold,
													color: Colors.white
												),) //TextStyle //Text
											],
										), // Row
										), // RaisedButton
									) // Container
								],
							), // Row
							Expanded(child: Align(
								alignment: Alignment.bottomCenter,
								child: Container(
									child: Row(
										children: [
											Text("Don't have an account?", style: TextStyle(
												color: Colors.grey
											),), // TextStyle // Text
											SizedBox(
												width: 5.0,
											), // SizedBox
											Text("Register", style: TextStyle(
												color: Style.Colors.mainColor,
												fontWeight: FontWeight.bold
											),) // TextStyle // Text
										],
									), // Row
								), // Container

							)),
							SizedBox(
								height:30.0,
							) // Align // Expanded
						],
						
					) // Column
				) // Form
				);  // Padding
			}), // BlocBuilder
			
		); // BlockListener
	}
}