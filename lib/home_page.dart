import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = [
    const ProductsTab(),
    const SearchTab(),
    const CartTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Text(
            "Cupertino Store",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Products",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              )
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return data[index];
              },
            );
          },
        ));
  }
}

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text(
                "Product 1",
              ),
              subtitle: const Text("200 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 2"),
              subtitle: const Text("100 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 3"),
              subtitle: const Text("300 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 4"),
              subtitle: const Text("400 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 5"),
              subtitle: const Text("500 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 6"),
              subtitle: const Text("600 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              leading: const FlutterLogo(size: 35),
              title: const Text("Product 7"),
              subtitle: const Text("700 ₹"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    ));
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '🔍    Search here...',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    String? name;
    String? email;
    String? location;
    final GlobalKey<FormState> contactInfoFormKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    return Material(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: IndexedStack(
            index: currentIndex,
            children: [
              // contact
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: contactInfoFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Expanded(
                              child: Icon(Icons.person, size: 35),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 10,
                              child: TextFormField(
                                controller: nameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your name first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  name = val;
                                },
                                decoration: const InputDecoration(
                                  label: Text("Name"),
                                  hintText: "Enter your name here",
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Expanded(child: Icon(Icons.email, size: 30)),
                            const SizedBox(width: 15),
                            Expanded(
                                flex: 10,
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter your email";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    email = val;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Email"),
                                    hintText: "Enter your email here",
                                    border: UnderlineInputBorder(),
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Expanded(
                                child: Icon(Icons.location_on, size: 30)),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 10,
                              child: TextFormField(
                                controller: locationController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your location";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  location = val;
                                },
                                decoration: const InputDecoration(
                                  label: Text("Location"),
                                  hintText: "Enter your location here",
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.blue,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext builder) {
                                      return CupertinoDatePicker(
                                        mode:
                                            CupertinoDatePickerMode.dateAndTime,
                                        onDateTimeChanged: (value) {},
                                        initialDateTime: DateTime.now(),
                                      );
                                    });
                              },
                              child: const Text(
                                "Pick Date",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        ListTile(
                          leading: const FlutterLogo(size: 35),
                          title: const Text(
                            "Product 4",
                          ),
                          subtitle: const Text("400 ₹"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add_circled,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const FlutterLogo(size: 35),
                          title: const Text(
                            "Product 1",
                          ),
                          subtitle: const Text("200 ₹"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add_circled,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const FlutterLogo(size: 35),
                          title: const Text(
                            "Product 5",
                          ),
                          subtitle: const Text("500 ₹"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add_circled,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
