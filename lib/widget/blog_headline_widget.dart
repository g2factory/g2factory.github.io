import 'package:flutter/material.dart';
import 'package:g2factory_page/config/front_config.dart';
import 'package:g2factory_page/repository/blog_repository.dart';

class BlogHeadlineWidget extends StatelessWidget {
  final Map<String, String> blog;
  BlogHeadlineWidget({Key key, this.blog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapUp: (_) {
          Navigator.of(context).pushNamed(FrontConfig.routeBlogPage, arguments: {"blog_id": BlogRepository.getBlogId(blog)});
        },
        child: Container(
          constraints: FrontConfig.pageContentSize,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          height: 40.0,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: FrontConfig.mainColor.shade100,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${blog["headline"]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade50,
                ),
              ),
              Text(
                '${blog["date"]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: FrontConfig.mainColor.shade100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}