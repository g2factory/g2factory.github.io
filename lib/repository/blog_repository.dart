import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:g2factory_page/config/back_config.dart';

class BlogRepository {
  AssetBundle _bundle;
  List<String> _blogPathList;

  BlogRepository(BuildContext context) {
    _bundle = DefaultAssetBundle.of(context);
  }

  Future<List<Map<String, String>>> loadBlogHeadlineList(
      {int offset = 0, int limit = 10}) async {
    List<Map<String, String>> blogHeadlineList = List<Map<String, String>>();
    List<String> blogPaths =
        await _loadBlogPathList(offset: offset, limit: limit);
    await Future.forEach(blogPaths, (path) async {
      Iterable<Match> blogMatch =
          RegExp(r"[^#\s][^\n<]+").allMatches(await loadBlog(path));
      blogHeadlineList.add({
        "headline": blogMatch.first.group(0),
        "date": RegExp(r"\d+").firstMatch(path).group(0)
      });
    });
    return blogHeadlineList;
  }

  Future<String> loadBlog(String path) {
    return _bundle.loadString(path);
  }

  static String getBlogId(Map<String, String> blog) {
    return '${BackConfig.blogPath}${blog["date"]}${BackConfig.blogExtension}';
  }

  Future<List<String>> _loadBlogPathList(
      {int offset = 0, int limit = 10}) async {
    if (_blogPathList != null) return _blogPathList;
    String manifestContent = await _bundle.loadString('AssetManifest.json');
    Map<String, dynamic> assets = json.decode(manifestContent);
    List<String> blogPaths = assets.keys
        .where((String key) => key.contains(BackConfig.blogPath))
        .where((String key) => key.contains(BackConfig.blogExtension))
        .toList()
          ..sort((a, b) => b.compareTo(a));
    return _blogPathList =
        blogPaths.skip(offset).take(min(limit, blogPaths.length)).toList();
  }
}
