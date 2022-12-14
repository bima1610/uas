import 'package:flutter/material.dart';
import 'package:uas/posts.dart';
import 'package:uas/detailPage.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.posts}) : super(key: key);
  final Posts posts;

  // const PostCard({required this.posts});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(posts.foto),
      ),
      title: Text(posts.alamat),
      trailing: Text('Rp. '+posts.harga),
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: ((context) {
              return DetailPage(posts: posts);
            }),
          ),
        );
      },
    );
  }
}