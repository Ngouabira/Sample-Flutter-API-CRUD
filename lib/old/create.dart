import 'package:flutter/material.dart';
import 'package:flutter_with_api/article.dart';
import 'package:flutter_with_api/article_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var title = TextEditingController();
  var description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextFormField(
              controller: description,
              decoration: const InputDecoration(hintText: "Description"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                var article = Article(0, title.text, description.text);
                await ArticleService.create(article);
                setState(() {
                  title.text = "";
                  description.text = "";
                });
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
