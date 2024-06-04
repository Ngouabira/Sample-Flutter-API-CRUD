import 'package:flutter/material.dart';
import 'package:flutter_with_api/article.dart';
import 'package:flutter_with_api/article_service.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({super.key});

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
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
          title: const Text("New article"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: const InputDecoration(hintText: "Type the title"),
            ),
            TextFormField(
              controller: description,
              decoration:
                  const InputDecoration(hintText: "Type the description"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                Article a = Article(0, title.text, description.text);
                await ArticleService.create(a);
                const snackBar = SnackBar(
                  content: Text('article created!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  title.text = "";
                  description.text = "";
                });
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
