import 'package:hive_ce_flutter/adapters.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  List<Person> friends = [];

  Person(this.name, this.age);
  void addFriend(Person newFriend) {
    friends.add(newFriend);
  }
}
