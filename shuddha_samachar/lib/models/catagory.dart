class Catagory{
  late String catagoryName;
  late String url;
  
}


List <Catagory> getCatagory() {
  
  List<Catagory> myCategories = <Catagory>[];
  Catagory categorieModel;

  
  categorieModel = Catagory();
  categorieModel.catagoryName = "Buisiness";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2e48ac443b974b14ac8787dee5492e36";
  
  myCategories.add(categorieModel);
  
  categorieModel = Catagory();
  categorieModel.catagoryName = "Sports";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=2e48ac443b974b14ac8787dee5492e36";
  
  myCategories.add(categorieModel);
  
  categorieModel = Catagory();
  categorieModel.catagoryName = "Health";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=2e48ac443b974b14ac8787dee5492e36";
  myCategories.add(categorieModel);
  
  categorieModel = Catagory();
  categorieModel.catagoryName = "Sceince";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=2e48ac443b974b14ac8787dee5492e36";
  myCategories.add(categorieModel);
  
  
  categorieModel = Catagory();
  categorieModel.catagoryName = "Tech";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=2e48ac443b974b14ac8787dee5492e36";
  myCategories.add(categorieModel);
  categorieModel = Catagory();
  categorieModel.catagoryName = "Entertainment";
  categorieModel.url = "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=2e48ac443b974b14ac8787dee5492e36";
  myCategories.add(categorieModel);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  return myCategories;
}