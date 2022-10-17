import 'package:flutter/material.dart';

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              indicatorWeight: 5,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "CHATS",
                ),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                ),
              ],
            ),
            title: const Text(
              'WhatsApp',
              style: TextStyle(fontSize: 25),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: const [
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 1',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('2:00 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 2',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('11:44 am')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 3',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('12:56 am')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 4',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('8:46 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 5',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('10:11 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 6',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('2:01 am')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 7',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('4:10 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 8',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('11:57 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 9',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('10:10 pm')),
                    SizedBox(height: 5),
                    ListTile(
                        leading: FlutterLogo(size: 40),
                        title: Text(
                          'Person 10',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Hello', style: TextStyle(fontSize: 18)),
                        trailing: Text('9:57 am')),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(
                        size: 40,
                      ),
                      title: Text(
                        'My Status',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Tap to add status update'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey.shade100,
                      height: 30,
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          Text(
                            'Recent Updates',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 5",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 10:11 pm'),
                    ),
                    Container(
                      color: Colors.grey.shade100,
                      height: 30,
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          Text(
                            'Viewed Updates',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Yesterday, 4:44 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 6:30 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 3",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 1:14 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 4",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Yesterday, 4:20 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 6",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 8:30 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 7",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 9:36 pm'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        'Person 8',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Today, 1:19 pm'),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: const [
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↙ Yesterday, 4:16 pm'),
                      trailing: Icon(
                        Icons.videocam,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 5",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↙ Today, 4:44 pm'),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 4",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↙ Today, 7:48 pm'),
                      trailing: Icon(
                        Icons.videocam,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 6",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↗ Yesterday, 2:18 pm'),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 9",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↙ Today, 2:48 pm'),
                      trailing: Icon(
                        Icons.videocam,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 3",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↗ Today, 11:29 pm'),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↗ Today, 8:47 pm'),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: FlutterLogo(size: 40),
                      title: Text(
                        "Person 7",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('↙ Today, 6:29 pm'),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
