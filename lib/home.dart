import 'package:flutter/material.dart';
import 'package:uas/posts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:uas/drawer.dart';
import 'package:uas/postCard.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Posts>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('http://localhost/uas_mobile/server_kontrakan.php'));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => Posts.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Posts>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kontrakan'),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      drawer: drawer_page(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<Posts>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<Posts>)[index];
                        return Column(
                          children: [
                            PostCard(
                              posts: Posts(
                                  id_kontrakan: post.id_kontrakan,
                                  foto: post.foto,
                                  kamar_mandi: post.kamar_mandi,
                                  kamar_tidur: post.kamar_tidur,
                                  garasi: post.garasi,
                                  no_telpon: post.no_telpon,
                                  alamat: post.alamat,
                                  harga: post.harga),

                            ),
                            SizedBox(height: 20)
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: (snapshot.data as List<Posts>).length);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}