import 'package:flutter/material.dart';

class CasesInfoPage extends StatefulWidget {
  const CasesInfoPage({Key? key}) : super(key: key);

  @override
  State<CasesInfoPage> createState() => _CasesInfoPageState();
}

class _CasesInfoPageState extends State<CasesInfoPage> {
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23,
    fontStyle: FontStyle.italic,
  );
  TextStyle numberStyle = TextStyle(
    fontSize: 20,
    color: Colors.black.withOpacity(0.4),
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text("${res.country}'s Cases"),
        actions: const [
          Icon(
            Icons.coronavirus,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          right: 13,
          left: 13,
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("${res.flag}", height: 100),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Cases",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${res.cases}",
                    style: numberStyle,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Deaths",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.deaths}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Recovered",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.recovered}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Critical",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.critical}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 165,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Tests",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.tests}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Population",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${res.population}",
                    style: numberStyle,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('recent', arguments: res);
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                backgroundColor: Colors.blue.shade400,
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                elevation: 7,
                enableFeedback: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Recent Condition  ▶",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
