class Hero {
  String firstName;
  String lastName;

  Hero(this.firstName, this.lastName);

  Hero.build(this.firstName, this.lastName) {
    this.firstName = "Hero ${this.firstName}";
  }
}

void main() {
  Hero h1 = new Hero("Fausto", "silva");
  Hero h2 = Hero.build("Fausto", "silva");
  print("${h1.firstName}, ${h1.lastName}");
  print("${h2.firstName}, ${h2.lastName}");
}
