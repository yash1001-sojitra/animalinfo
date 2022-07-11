class Category {
  String species;
  String animalName;
  String imagename;

  List<Category> subcategory;

  Category({
    required this.species,
    required this.animalName,
    required this.imagename,
    required this.subcategory,
  });
}

class Subcategory {
  String animaldata;

  Subcategory({
    required this.animaldata,
  });
}

class Speciescategory {
  String species;
  String imagename;
  List<Speciescategory> speciessubcategory;

  Speciescategory({
    required this.species,
    required this.imagename,
    required this.speciessubcategory,
  });
}