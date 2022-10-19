import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Map web = <String, String>{
    "images/netflix.png": "https://www.netflix.com/in/",
    "images/amazon.png":
        "https://www.primevideo.com/?ref_=dvm_pds_amz_in_as_s_g_148_mkw_swaDaJpSP-dc&mrntrk=pcrid_386559717051_slid__pgrid_82649959887_pgeo_9062189_x__ptid_kwd-360266561005",
    "images/disney+.png": "https://www.hotstar.com/in",
    "images/sonyliv.png": "https://www.sonyliv.com/",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Web View"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: web.entries
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("web", arguments: e);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 30),
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(e.key),
                          ),
                          color: Colors.lightBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
