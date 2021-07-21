
import 'package:flutter/material.dart';
import 'package:marvel_character_app/models/character.dart';
import 'package:marvel_character_app/styleguide.dart';
import 'package:marvel_character_app/widgets/character_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  late PageController _pageController;
  int currentPage = 0;
  _launchURL() async {
    String url =
        'https://www.privacypolicies.com/live/bb24f41f-2a90-4af3-964f-0b890bb24971';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // throw 'Could not launch $url';
       _showErrorSnackBar();
    }
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        color: Color(0xffE0E0E0),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                color: Colors.black,
                // color: Color(0xffFFc107),
                padding: EdgeInsets.only(top: 0),
                child: Center(
                  child: Image.asset(
                    'assets/images/icon.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2.5,
              color: Colors.white,
            ),
            // UserAccountsDrawerHeader(
            //   accountName: Text("Hello Guys!"),
            //   accountEmail: Text("Welcome!"),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundColor: Colors.black87,
            //   ),
            // ),

            // ListTile(
            //   title: Text("Dark Mode"),
            //   trailing: Icon(Icons.settings_cell),
            //   // leading: CircleAvatar(child: Text("B")),
            // ),
            // Divider(
            //   color: Colors.white,
            //   thickness: 2.0,
            // ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.help),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('About'),
                    content: Text(
                        'An app for marvel lovers. It contains all your favourites . Do not forget to check video clips links for your favourite character. This is only a test version app, updates will contain more marvel stuff. Do give us your feedbacks in comments. :-)'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop(); // dismisses only the dialog and returns nothing
                        },
                        child: new Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Terms & Conditions"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Terms & Conditions'),
                    content: Text(
                        'We are all just marvel fans here and so no Terms and Conditions! :-)'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop(); // dismisses only the dialog and returns nothing
                        },
                        child: new Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              // subtitle: miniicon(Icons.security),
              trailing: Icon(Icons.security),
            ),
            //---------------------------

            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Privacy Policy'),
                    content: Text(
                        'Do you wanted to be redirected to the Privacy Policy page?'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop(); // dismisses only the dialog and returns nothing
                        },
                        child: new Text('NO'),
                      ),
                      new FlatButton(
                        onPressed:
                            _launchURL, // dismisses only the dialog and returns nothing

                        child: new Text('YES'),
                      ),
                    ],
                  ),
                );
              },
              // subtitle: miniicon(Icons.security),
              trailing: Icon(Icons.settings),
            ),

            //-----------
            Divider(
              color: Colors.white,
              thickness: 2.0,
            ),
            // ListTile(
            //   title: Text("Rate Us"),
            //   trailing: Icon(Icons.star),
            //   // leading: CircleAvatar(child: Text("B")),
            // ),
            // Divider(
            //   thickness: 2.0,
            //   color: Colors.white,
            // ),
            ListTile(
              title: Text("Contact Us"),
              trailing: Icon(Icons.contact_mail),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Contact Us'),
                    content: Text(
                        'Feel Free to Contact Us at -: almipytechnologies@gmail.com'),
                    actions: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop(); // dismisses only the dialog and returns nothing
                        },
                        child: new Text('OK'),
                      ),
                    ],
                  ),
                );
              },

              // leading: CircleAvatar(child: Text("B")),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text("Close"),
              // subtitle: Text("CLoses Window"),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CharacterListingScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
            Divider(
              thickness: 2.0,
              color: Colors.white,
            ),
          ],
        ),
      )),
      appBar: AppBar(
          // leading: Icon(Icons.arrow_back_ios),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 16),
          //     child: Icon(Icons.search),
          //   ),
          // ],

          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child:
                    // Image.asset(
                    //   'assets/images/icon.jpg',
                    //   // fit: BoxFit.fill,
                    // ),
                    RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Marvelites", style: AppTheme.display1),
                      TextSpan(text: "\n"),
                      TextSpan(text: "Assemble", style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    for (var i = 0; i < characters.length; i++)
                      CharacterWidget(
                          character: characters[i],
                          pageController: _pageController,
                          currentPage: i)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
