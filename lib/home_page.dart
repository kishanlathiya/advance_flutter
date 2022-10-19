import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Map<String, String> web = {
    "https://gumlet.assettype.com/freepressjournal/2021-01/b935b052-452e-412c-a38f-14d6114ee665/wiki.png?format=webp&w=400&dpr=2.6":
        "https://en.wikipedia.org/wiki/Main_Page",
    "https://play-lh.googleusercontent.com/dOj01WoJAfGmugoidMOOxrorAfmWTjkKeukQ6icTxAwjk7C5L1kQg9WdyGgLLoJCLw":
        "https://www.w3schools.com/",
    "https://avatars.githubusercontent.com/u/10328309?v=4":
        "https://www.javatpoint.com/",
    "https://1800ci.com/wp-content/uploads/2020/08/unnamed.png":
        "https://www.tutorialspoint.com /index.htm",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: web.entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("web_load_page", arguments: e);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 30),
                  height: 150,
                  width: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(e.key),
                      ),
                      color:  Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
