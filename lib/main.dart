import 'package:flutter/material.dart';
import 'package:gallery_app/userData.dart';


const Color primaryColor = Color(0xff9DC7E6);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GalleryApp());
  }
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.camera_alt,
            color: primaryColor,
          )
        ],
        // toolbarHeight: 100,
        flexibleSpace: Container(),
        bottom: PreferredSize(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(30)),

        backgroundColor: Colors.white,
        title: Text(
          "Gallery",
          style: TextStyle(color: primaryColor),
        ),
        leading: Icon(
          Icons.chevron_left,
          color: primaryColor,
          size: 30,
        ),
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, int index) => displayUserInfor(
              context: context,
              userName: userData[index]["userName"],
              userProfile: userData[index]["userProfileImage"],
              userLocation: userData[index]["userLocation"],
              userPost: userData[index]["userPost"])),
    );
  }

  displayUserInfor({userName, userLocation, userPost, context, userProfile}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(userProfile),
                  radius: 50,
                ),
                title: Text(userName),
                subtitle: Row(
                  children: [Icon(Icons.location_on), Text(userLocation)],
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(userPost))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text("124"),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [Icon(Icons.comment), Text("23")],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
