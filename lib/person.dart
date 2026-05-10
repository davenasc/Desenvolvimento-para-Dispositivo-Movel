import 'package:hive_ce/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? age;
  @HiveField(3)
  List<Person> friends = [];

  Person(this.name, this.age);
  addFriend(Person newFriend) {
    friends.add(newFriend);
  }
}
