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

class MAMMALS {
  String animalname;
  String imagename;
  List<MAMMALS> mammalssubcategory;

  MAMMALS({
    required this.animalname,
    required this.imagename,
    required this.mammalssubcategory,
  });
}

class REPTILES {
  String animalname;
  String imagename;
  List<REPTILES> reptilesubcategory;

  REPTILES({
    required this.animalname,
    required this.imagename,
    required this.reptilesubcategory,
  });
}

class AMPHICIANS {
  String animalname;
  String imagename;
  List<AMPHICIANS> subcategory;

  AMPHICIANS({
    required this.animalname,
    required this.imagename,
    required this.subcategory,
  });
}

class BIRDS {
  String animalname;
  String imagename;
  List<BIRDS> subcategory;

  BIRDS({
    required this.animalname,
    required this.imagename,
    required this.subcategory,
  });
}

class INVERTEBRATES {
  String animalname;
  String imagename;
  List<INVERTEBRATES> subcategory;

  INVERTEBRATES({
    required this.animalname,
    required this.imagename,
    required this.subcategory,
  });
}

class FISH {
  String animalname;
  String imagename;
  List<FISH> subcategory;

  FISH({
    required this.animalname,
    required this.imagename,
    required this.subcategory,
  });
}
