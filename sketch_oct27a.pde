PImage img;
PImage b;
String dest;
HashMap library; // Hashmap will hold object names with Binary hash as keys
ArrayList<String> hashes = new ArrayList<String>();
int avg;
String path = "/Users/evanlivingston/Documents/Processing/Sketch_oct27a/data";
int sz = 8;



//----------------------------------------------------------------------------    

void setup() {
  frameRate(22);
  library = new HashMap<Integer, Object>();
  size(600, 400);
  println("Listing all filenames in a directory: ");
  String[] filenames = listFileNames(path);
  
  
  for (int i = 0; i < filenames.length; i++) {
      String filename = filenames[i];
      img = loadImage(filename);
      image(img, 0, 0, sz, sz);
      filter(GRAY);
      int avgAcc = 0;
      //println(filenames[i]);
      for (int y = 0; y < sz-1; y++) {
        for (int x = 0; x < sz-1; x++) {
          color d = get(x,y);
          int r = d >> 16 & 0xFF;
          avgAcc = avgAcc + r;
          avg = avgAcc / (sz*sz);
          //println("color =" + r + " avg = " + avg);
          //println(binary(r));
        }
      }
     String hash = "";
     for (int y = 0; y < sz-1; y++) {
       for (int x = 0; x < sz-1; x++) {
         color z = get(x,y);
         int r = z >> 16 & 0xFF;
         if (r >= avg) {
           hash = hash + "1";
         }
         else {
           hash = hash + "0";
         }     
       }  
     }
    //create an ArrayList of the Binary hashes
    if (hashes.contains(hash)) {
    } else {
    hashes.add(hash);
    }

  if (library.containsKey(hash)) {
    //println("Already " + hash + " - " + filename);
    aBinString c = (aBinString) library.get(hash);
    c.images(filename); //Add filenames to object
  } else {
    //println("Added " + hash + " - " + filename);
    aBinString c = new aBinString(hash);
    library.put(hash, c);  // Start by adding one element
    c.images(filename);
    } 
  }

//put hashes ArrayList into each object
for (int z = 0; z < hashes.size(); z++) {
  aBinString c = (aBinString) library.get(hashes.get(z));
  c.addHashes(hashes); 
}
  dest = (hashes.get((int(random(hashes.size()))))); //pick a random image in the library
}


//----------------------------------------------------------------------------    

 void draw() {
    aBinString currentHash = (aBinString) library.get(dest); //print object name
    println("Current Hash = " +currentHash.name); //print name of object
    String nextIMG = (currentHash.images.get((int(random(currentHash.images.size())))));
    println("Possible Images " + currentHash.images + " ## Selected:" + nextIMG);
    
    b = loadImage(nextIMG);
    image(b, 0, 0, 600, 400);
    String dee = currentHash.pickRandom();
    dest = dee;
    println("Next hash = " + dest);

  //noLoop();
}

//----------------------------------------------------------------------------    

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}



