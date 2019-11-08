
class ListPaged<T>{

  final List<T> items;
  final int pageSize;
  final int pageNumber;
  final int count;

  ListPaged({this.items, this.pageSize, this.pageNumber, this.count});

  factory ListPaged.fromJson(map, T Function(Map<String, dynamic> m) itemFromJson){
    var list = map["items"] as List;
    var listItems = list.map((model) => itemFromJson(model)).toList();
    return ListPaged(
      items: listItems,
      pageSize:  map["pageSize"],
      pageNumber: map["pageNumber"],
      count: map["count"],
    );
  }

}