import 'package:flutter/material.dart';
import 'package:uas/main.dart';

class drawer_page extends StatelessWidget {
  const drawer_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(
            image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/User_icon-cp.svg/1200px-User_icon-cp.svg.png',
            nama: 'Bima Baskoro Aji',
            email: 'bimabaskoroaji@gmail.com',
            onTap: () => print('Klik MyProfile'),
          ),
          // _drawerItem(
          //   icon: Icons.home,
          //   text: 'Home',
          //   onTap: () => print('Klik Menu Home'),
          // ),
          // _drawerItem(
          //   icon: Icons.account_circle_rounded,
          //   text: 'Kontak',
          //   onTap: () => print('Klik Menu Kontak'),
          // ),
          // _drawerItem(
          //   icon: Icons.group,
          //   text: 'Group',
          //   onTap: () => print('Klik Menu Group'),
          // ),
          Divider(height: 25, thickness: 1,),
          _drawerItem(
            icon: Icons.logout,
            text: 'Log Out',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyApp()));
            },
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader({required String image, required String nama,required GestureTapCallback onTap, required String email}){
  return UserAccountsDrawerHeader(
    currentAccountPicture: new GestureDetector(
      onTap: onTap,
      child: Image(image: NetworkImage(image),
          fit: BoxFit.cover),
    ),
    accountName: Text(nama),
    accountEmail: Text(email),
  );
}

Widget _drawerItem({required IconData icon, required String text,required GestureTapCallback onTap})
{
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
