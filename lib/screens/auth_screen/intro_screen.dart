import 'package:authwithrest/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:authwithrest/style/theme.dart' as Style;

class IntroPage extends StatefulWidget {
	final UserRepositories userRepositories;
	IntroPage({Key key, @required this.userRepositories}): super (key: key);
	@override
	_IntroPageState createState() => _IntroPageState(userRepositories);

}

class _IntroPAgeState extends State<IntroPage> {
	final UserRepositories userRepositories;
	_IntroPageState(this.userRepositories);

	bool clicked = false;

	void afterIntroComplete () {
		setState(() {
			clicked = true;
		})
	}

	final List<PageViewModel> pages = [
		PageViewModel(
			titleWidget: Column(
				children: <Widget>[
					Text('BUY PRODUCTS', style: TextStyle(
						fontSize: 18.0, fontWeight: FontWeight.w600
					), ), // Textstyle //Text
					SizedBox(
						height: 8.0,
					), // Sizedbox
					Container(
						height: 3.0,
						width:100.0,
						decoration: BoxDecoration(
							color: Style.Colors.mainColor,
							borderRadius: BorderRadius.circular(10.0)
						), //BoxDecoration
					) // Container
				], // <Widget>[]
			), // Column
			body: "Buy any product from our stores while stocks last"
			image: Center (
				child: SvgPicture.asset('assets/icons.image1.svg'),
			)
		), // PageViewModel
		PageViewModel(
			titleWidget: Column(
				children: <Widget>[
					Text('EXPLORE STORES', style: TextStyle(
						fontSize: 18.0, fontWeight: FontWeight.w600
					), ), // Textstyle //Text
					SizedBox(
						height: 8.0,
					), // Sizedbox
					Container(
						height: 3.0,
						width:100.0,
						decoration: BoxDecoration(
							color: Style.Colors.mainColor,
							borderRadius: BorderRadius.circular(10.0)
						), //BoxDecoration
					) // Container
				], // <Widget>[]
			), // Column
			body: "Find some of your favourite stores"
			image: Center (
				child: SvgPicture.asset('assets/icons.image2.svg'),
			)
		), // PageViewModel
		PageViewModel(
			titleWidget: Column(
				children: <Widget>[
					Text('GET STARTED', style: TextStyle(
						fontSize: 18.0, fontWeight: FontWeight.w600
					), ), // Textstyle //Text
					SizedBox(
						height: 8.0,
					), // Sizedbox
					Container(
						height: 3.0,
						width:100.0,
						decoration: BoxDecoration(
							color: Style.Colors.mainColor,
							borderRadius: BorderRadius.circular(10.0)
						), //BoxDecoration
					) // Container
				], // <Widget>[]
			), // Column
			body: "Get Started Today"
			image: Center (
				child: SvgPicture.asset('assets/icons.image3.svg'),
			)
		) // PageViewModel
	];

	@override
	Widget build(BuildContext context) {
		return clicked ? LoginScreen(userRepositories: userRepositories,) : IntoductionScreen(
			pages: pages,
			onDone: () {
				afterIntroComplete();
			},
			onSkip: () {
				afterIntroComplete();
			},
			showSkipButton: true,
			skip: Text('Skip', style: TextStyle(
				fontWeight: FontWeight.w600,
				color: Colors.grey
			), ), // TextStyle // Text
			next: Icon(Icons.navigate_next),
			done: Text("Done", style: TextStyle(
				fontWeight: FontWeight.w600,
			), ), // TextStyle // Text
			dotsDecoratior: DotsDectorator(
				size: Size.square(7.0),
				activeSize: Size(20.0, 5.0),
				activeColor: Style.Colors.mainColor,
				color: Colors.black26,
				spacing: EdgeInsets.symmetric(
					horizontal: 3.0
				),
				activeShape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(5.0)		
				),
			),
		
		);
	}
}