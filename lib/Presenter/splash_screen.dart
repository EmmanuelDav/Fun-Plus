import 'package:flutter/material.dart';
import 'package:fun_pluz/Provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../main.dart';
import '../model/classes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool storedValue = prefs.getBool('boolValue') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkTheme: storedValue),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.getThemeData,
      home: OnboardScreen(),
    );
  }
}

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  List<OnBoardModel> allOnBoardScreen = [
    OnBoardModel(
        "assets/slide_1.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepard by exparts"),
    OnBoardModel(
        "assets/slide_2.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    OnBoardModel(
        "assets/slide_3.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Express",
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allOnBoardScreen.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title: allOnBoardScreen[index].titlestr,
                    description: allOnBoardScreen[index].description,
                    imgurl: allOnBoardScreen[index].imgStr);
              }),
          Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            left: MediaQuery
                .of(context)
                .size
                .width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allOnBoardScreen.length,
                    (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allOnBoardScreen.length - 1
              ? Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.2,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Previous",
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0))),
                  ),
                )
              ],
            ),
          )
              : Positioned(
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.2,
            left: MediaQuery
                .of(context)
                .size
                .width * 0.33,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
              child: Text(
                "Get Started",
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}


class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;

  PageBuilderWidget({Key key,
    this.title,
    this.description,
    this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                color: themeProvider.getThemeData == true ? Colors.white : Colors.black ,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: themeProvider.getThemeData == true ? Colors.white : Colors.black ,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}

