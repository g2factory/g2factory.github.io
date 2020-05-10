class CompanyConfig {
  static const String companyName = 'g2factory';
  static const List<MapEntry<String, Map<String, String>>> members = [
    MapEntry(
      'ohira',
      {
        'name': 'おひら',
        'mail': 'ohira@g2factory.net',
        'icon': 'images/ohira/ohira03.png',
        'skill': '簡単なホームページ制作/運営\nWebアプリ\nAndroid/iOSアプリ\n'
          'AWSインフラ構築\n分析基盤構築\ndocker化'
      }
    ),
    MapEntry(
      'fujii',
      {
        'name': 'ふじい',
        'mail': 'fujii@g2factory.net',
        'icon': 'images/fujii/fujii.png',
        'skill': '動画コンテンツプロデュース/作成\n動画制作のコンサルタント',
        'achieve':
          'テレビ東京\n'
            '  「木曜8時のコンサート〜名曲！にっぽんの歌〜」\n'
            '  「金曜7時のコンサート〜名曲！にっぽんの歌〜」\n'
            '  「歌いーな！」\n'
            '  「年忘れにっぽんの歌」\n'
            '  「夏祭りにっぽんの歌」\n'
          'BSスカパー！\n'
            '  「FULL CHORUS〜音楽は、フルコーラス〜」\n'
          'あにてれ配信番組\n'
            '  「諸星すみれ・吉永拓斗のマジメに学ぶアニメ講座」\n'
          'Yahoo!JAPANライブ配信番組\n'
            '  「ワイキュー」\n'
          'ニコニコ生放送特番\n'
            '  「全力！ネットユーザーつくり場」'
      },
    )
  ];
}