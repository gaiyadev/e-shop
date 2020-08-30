import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserProductItem({
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            IconButton(
              color: Colors.red,
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
