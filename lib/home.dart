import 'package:flutter/material.dart';
import 'package:flutter_with_api/article.dart';
import 'package:flutter_with_api/article_service.dart';
import 'package:flutter_with_api/calculatrice.dart';
import 'package:flutter_with_api/create.dart';
import 'package:flutter_with_api/edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> listArticle = [];
  bool isRefresh = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    var data = await ArticleService.getAll();
    setState(() {
      listArticle = data.map((data) => Article.fromJson(data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Home'),
            ),
            ListTile(
              title: const Text('List'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Calculator'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CalculatorPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: listArticle.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listArticle[index].title),
            subtitle: Text(listArticle[index].description),
            leading: const CircleAvatar(
              backgroundImage: AssetImage('images/1.png'),
            ),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () async {
                    bool refresh = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditArticlePage(
                          article: listArticle[index],
                        ),
                      ),
                    );
                    if (refresh) {
                      loadData();
                    }
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    await ArticleService.delete(listArticle[index].id);
                    loadData();
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool refresh = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateArticlePage(),
            ),
          );
          if (refresh) {
            loadData();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
