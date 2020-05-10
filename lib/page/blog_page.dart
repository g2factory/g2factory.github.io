import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/repository/blog_repository.dart';
import 'package:g2factory_page/widget/base_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPage createState() => _BlogPage();
}

class _BlogPage extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    if (args == null || args["blog_id"] == null) {
      return BaseWidget(
        body: Center(
          child: Text(
            "ページが見つかりません",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: FrontConfig.mainColor.shade50,
            ),
          ),
        ),
      );
    }
    BlogRepository _blog = BlogRepository(context);
    return BaseWidget(
      body: Center(
        child: FutureBuilder(
          future: _blog.loadBlog(args["blog_id"]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.hasError) return Text('再度読み込みをしてください');
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FrontConfig.mainColor.shade50,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  constraints: FrontConfig.pageContentSize,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: MarkdownBody(
                    data: snapshot.data
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}