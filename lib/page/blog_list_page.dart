import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/repository/blog_repository.dart';
import 'package:g2factory_page/widget/base_widget.dart';
import 'package:g2factory_page/widget/blog_headline_widget.dart';

class BlogListPage extends StatefulWidget {
  @override
  _BlogListPage createState() => _BlogListPage();
}

class _BlogListPage extends State<BlogListPage> {
  bool _canLoad = true;
  List<Map<String, String>> _itemList = List<Map<String, String>>();

  @override
  Widget build(BuildContext context) {
    BlogRepository _blog = BlogRepository(context);
    return BaseWidget(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.all(16.0),
              constraints: FrontConfig.pageContentSize,
              child: Text(
                'ぶろぐ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _itemList.length && _canLoad) {
                      _blog
                          .loadBlogHeadlineList(offset: _itemList.length)
                          .then((addItemList) {
                        _canLoad = addItemList.length > 0;
                        setState(() {
                          _itemList.addAll(addItemList);
                        });
                      });
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    } else if (index >= _itemList.length) {
                      return null;
                    }
                    return BlogHeadlineWidget(blog: _itemList[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
