

class aBinString
{
  String name;
  Dists [] o;
  int rantest;
  String newImage;
  ArrayList<String> images = new ArrayList<String>();
  ArrayList<String> hashes = new ArrayList<String>();
  String BinStrings;
  int distance;
  
    aBinString(String nameTemp) {
    name = nameTemp; 
    }
    
//----------------------------------------------------------------------------    

  void images(String imageTemp) { //Add filenames to object
    newImage = imageTemp;
    if (images.contains(newImage)) {
    } else {
    images.add(newImage);
    }    
  }
  
  
//----------------------------------------------------------------------------    
  
   void addHashes(ArrayList hashesTemp) {
    hashes = hashesTemp;
    o = new Dists[hashes.size()]; // create array of objects to sort.
    for(int i=0;i<hashes.size();i++) {  // iterate through Binary Strings.
     String s1 = name; //s1 gets the object Binary String
     String s2 = hashes.get(i); // s2 gets all the other Binary Strings
    
     int hamDist = 0; // accumilator for hamming distances
     for (int x = 0; x < s1.length(); x++) { //iterate through the length of the binary string
       if (s1.charAt(x)==s2.charAt(x)) { //if the bit is the same, pass
      } else { // if the bit is different, add 1 to distance
        hamDist = hamDist + 1;
      }
    }

    o[i] = new Dists(s1, hamDist, s2);
    //println(hamDist + "-" + s1 + "-" + s2);
    }
    Arrays.sort(o);
    //for(int i=0;i<o.length;i++) {
    //println(i + "," + o[i].origin+ ": " + o[i].destination+" "+o[i].distance); 
  //}
   
  //println ("dest = " + o[1].destination);

 
  
  }
  String pickRandom() {
    rantest = int(random(1,30));
    return (o[rantest].destination);
  }
}
  
  
//----------------------------------------------------------------------------      
  
class Dists implements Comparable {
  int distance;
  String destination, origin;
  Dists(String theOrigin, int theDistance,String theDestination) {
    destination = theDestination;
    distance = theDistance;
    origin = theOrigin;
  }
  //if we want to sort based on the X value of MyObj-es:
  int compareTo(Object o)
  {
    Dists other=(Dists)o;
    if(other.distance>distance)  
      return -1;
    if(other.distance==distance)
      return 0;
    else
      return 1;
  }
}

