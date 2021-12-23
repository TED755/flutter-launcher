class Book {
  final String id;
  final String author;
  final String title;
  final String description;
  final String full_text;
  final int page_number;
  final String icon;

  Book(this.id, this.author, this.title, this.description, this.full_text,
      this.icon, this.page_number);

  static Book handMade(id, title) {
    return Book(id, "author", title, "decription", "full_text", "None", 100);
  }

  static Book fromJson(jsonData) {
    return Book(
        jsonData['id'],
        jsonData['author'],
        jsonData['title'],
        jsonData['description'],
        jsonData['full_text'],
        jsonData['icon'],
        jsonData['page_number']);
  }
}
