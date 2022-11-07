import 'package:flutter/material.dart';
import 'Jsonmodelclass.dart';
import 'APIhelperclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Detail?>?> fetchCovidCases;

  @override
  initState() {
    super.initState();
    fetchCovidCases = APIHelper.apiHelper.fetchCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Covid Case',
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          FutureBuilder(
            future: fetchCovidCases,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List<Detail> data = snapshot.data as List<Detail>;
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/img.png"),
                        )),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.81),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: data
                              .map(
                                (e) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(30),
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: (data.indexOf(e) % 2 == 0)
                                                ? Colors.orange
                                                : Colors.green,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            e.state,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          margin: const EdgeInsets.all(30),
                                          height: 50,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            color: (data.indexOf(e) % 2 == 1)
                                                ? Colors.orange
                                                : Colors.green,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            e.cases.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
