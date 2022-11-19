class Post {
  String? title;
  int? numUpVotes;
  int? numDownVotes;


  Post({this.title, this.numUpVotes, this.numDownVotes});

  String toString() {
    return 'Post($title,$numUpVotes,$numDownVotes)';
  }

  static generateData() {
    return [
      Post(title: "Go Module Mirror and Checksum Database Launched (goland.org)", numUpVotes: 3, numDownVotes: 0),
      Post(title: "Dqlite - High-Availability SQLite (dqlite.io)", numUpVotes: 2, numDownVotes: 2),
      Post(title: "A deep dive into iOS Exploit chains found in the wild (googleprojectzero.blogspot.com)", numUpVotes: 3, numDownVotes: 0),
      Post(title: "NPM Bans Terminal Ads (zdnet.com)", numUpVotes: 0, numDownVotes: 1),
      Post(title: "The Portuguese Bank Note Crisis of 1925 (wikipedia.org)", numUpVotes: 2, numDownVotes: 0),
    ];

  }

}
