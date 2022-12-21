import 'package:flutter/material.dart';
import '../helper/random_user_api_helper.dart';
import '../modal/modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random People's Data"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder(
        future: UserAPI.userAPI.fetchUserAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            RandomData? data = snapshot.data;
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 45),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 0),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      data!.image,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 70,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${data.title} ${data.firstName} ${data.lastName}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  customRow("Username", data.username),
                  customRow("Email", data.email),
                  customRow("Phone", data.phone),
                  customRow("Gender", data.gender),
                  customRow("Age", data.age),
                  const SizedBox(height: 5),
                  const Text(
                    "Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      data.address,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  customRow(fldName, data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$fldName",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                "$data",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}
