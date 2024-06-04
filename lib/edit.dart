import 'package:flutter/material.dart';
import 'package:flutter_with_api/article.dart';
import 'package:flutter_with_api/article_service.dart';

class EditArticlePage extends StatefulWidget {
  final Article? article;
  const EditArticlePage({super.key, this.article});

  @override
  State<EditArticlePage> createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
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
          title: const Text("Edit article"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: title..text = "${widget.article?.title}",
              decoration: const InputDecoration(hintText: "Type the title"),
            ),
            TextFormField(
              controller: description..text = "${widget.article?.description}",
              decoration:
                  const InputDecoration(hintText: "Type the description"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                int id = widget.article?.id ?? 0;
                Article a = Article(id, title.text, description.text);
                await ArticleService.update(a);
                const snackBar = SnackBar(
                  content: Text('Articled edited!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop(true);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
