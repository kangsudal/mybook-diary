class BookModel{
  String title;
  String author;
  int shelfNum;
  int status;
  int totalPage;
  Map<String, bool> passions ={
    "cooking": false,
    "history": false,
    "education":false,
  };

  BookModel({this.title,this.author,this.shelfNum,this.status,this.totalPage});

  save(){
    print("Saving book model using a web service");
    print("title:$title,\nauthor:$author,\n");
    print("totalPage:$totalPage");
  }
}