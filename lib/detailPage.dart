import 'package:flutter/material.dart';
import 'package:uas/posts.dart';
import 'package:uas/home.dart';

class DetailPage extends StatelessWidget {
  // DetailPage({Key? key, required Posts posts}) : super(key: key);

  final Posts posts;
  const DetailPage({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title: Text("Detail Kontrakan"),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.network("${posts.foto}",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("${posts.harga}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue
                              ),),
                            Text("                                           "),
                            Icon(Icons.remove_red_eye_outlined),
                            Text(" 5", style: TextStyle(),)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.bed, size: 30,),
                            Text(" ${posts.kamar_tidur}", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Divider(height: 25, thickness: 1,),
                        Row(
                          children:<Widget>[
                            Icon(Icons.bathroom_outlined ,size: 30,),
                            Text(" ${posts.kamar_mandi}", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Divider(height: 25, thickness: 1,),
                        Row(
                          children:<Widget>[
                            Icon(Icons.garage_outlined ,size: 30,),
                            Text(" ${posts.garasi}", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Divider(height: 25, thickness: 1,),
                        Row(
                          children:<Widget>[
                            Icon(Icons.phone ,size: 30,),
                            Text(" ${posts.no_telpon}", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Divider(height: 25, thickness: 1,),
                        Row(
                          children:<Widget>[
                            Icon(Icons.location_on_outlined ,size: 30,),
                            Text(" ${posts.alamat}", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Divider(height: 25, thickness: 1,),
                        TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.red),
                            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home())),
                            child: Text('Kembali', style: TextStyle(color: Colors.white),)
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}