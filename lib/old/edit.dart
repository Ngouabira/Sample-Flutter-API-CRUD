import 'package:flutter/material.dart';
import 'package:flutter_with_api/article.dart';
import 'package:flutter_with_api/article_service.dart';

class EditPage extends StatefulWidget {
  final Article? article;

  const EditPage({Key? key, this.article}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var title = TextEditingController();
  var description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(
        children: [
          TextFormField(
            // initialValue: widget.article?.title,
            controller: title..text = "${widget.article?.title}",
            decoration: const InputDecoration(hintText: "Title"),
          ),
          TextFormField(
            // initialValue: widget.article?.description,
            controller: description..text = "${widget.article?.description}",
            decoration: const InputDecoration(hintText: "Description"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              int id = widget.article?.id ?? 0;
              var a = Article(id, title.text, description.text);
              ArticleService.update(a)
                  .then((value) => Navigator.of(context).pop(true));
            },
            child: const Text('Edit'),
          )
        ],
      ),
    );
  }
}
