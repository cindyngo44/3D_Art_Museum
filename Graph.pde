class Vertex {
    //Painting Attributes
    String id;
    String title;
    String artist;
    String culture;
    String imgUrl;
    String hex1;
    String hex2;
    String hex3;
    String percent1;
    String percent2;
    String percent3;
    String hue1;
    String hue2;
    String hue3;
    String year;
    PImage img;

    Vertex(String id, String title, String artist, String culture, String imgUrl, String hex1, String hex2, String hex3, String percent1, String percent2, String percent3,
    String hue1, String hue2, String hue3, String year){
        
        this.id = id;
        this.title= title;
        this.artist= artist;
        this.culture= culture;
        this.imgUrl = imgUrl;
        this.hex1= hex1;
        this.hex2= hex2;
        this.hex3=hex3;
        this.percent1=percent1;
        this.percent2= percent2;
        this.percent3=percent3;
        this.hue1= hue1;
        this.hue2=hue2;
        this.hue3=hue3;
        this.year=year;    
        //this.img = "img";
  
        //reference: https://processing.org/reference/loadImage_.html
        //this.img = loadimg(imgURL, "png";)

    }

}


class Graph{
  //TODO: create boolean variables to know which type of graph to make
  //(Painting Category + Relationships
  boolean culture;
  boolean timePeriod;
  boolean allPaintings;
  boolean colors;
  boolean titles;
  boolean timeLine;
  boolean locations;
  
  //Components for adjList graph
  int numVertices;
  HashMap<Integer,ArrayList<Vertex>> adjList = new HashMap<Integer,ArrayList<Vertex>>();

  //when we create new vertices, we store here in no order
  ArrayList<Vertex> vertexStorage = new ArrayList<Vertex>();
  //Enpty Constructor
  Graph(){
  }
  
  //set the graph variables
  void setGraph(boolean culture, boolean timePeriod, boolean allPaintings,
    boolean colors, boolean titles, boolean timeLine){
    this.culture = culture;
    this.timePeriod = timePeriod;
    this.allPaintings = allPaintings;
    this.colors = colors;
    this.titles = titles;
    this.timeLine = timeLine;
  } 
  //Types of graphs we may make

  //Vertex: Time Period Edge: Color
  //Vertex: Time Period Edge: Title
  //Vertex: Time Period Edge: Year

  //Vertex: Culture Edge: Color
  //Vertex: Culture Edge: Title
  //Vertex: Culture Edge: Year

  //Vertex: All paintings Edge: Color
  //Vertex: All paintings Edge: Title
  //Vertex: All paintiings Edge: Year
  
  //buildGraph: is called after setting booleans, this function will check said
  //boolean functions and call addEdge____ for the appropriate graph construction
  void buildGraph(){
    if(colors){
      addEdgeColor();
    }
    else if(titles){
      addEdgeTitle();
    }
    else if(timeLine){
      addEdgeYear();
    }
  }
  void addEdgeColor(){
    //given vertexStorage
    if(allPaintings){
      for(int i = 0; i < numVertices; i++){
        //iterate through vertexStorage
        //grab vertex at indices hue name
        //iterate thourgh num vertices and find all vertices hues that match hue name
        //EXCLUDING THE CURRENT VERTEX
        String hue = vertexStorage.get(i).hue1;
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String hue2 = vertexStorage.get(j).hue1;
            if(hue.equals(hue2)){
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    }
    //Similar to allPaintings but also accounting for culture strings matching
    else if(culture){
        for(int i = 0; i < numVertices; i++){
        String culture1 = vertexStorage.get(i).culture;
        String hue = vertexStorage.get(i).hue1;
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String culture2 = vertexStorage.get(j).culture;
            String hue2 = vertexStorage.get(j).hue1;
            if(hue.equals(hue2) && culture1.equals(culture2)){
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    }
    else if(timePeriod){
      int min = 0;
      int max = 0;
      for(int i = 0; i < numVertices; i++){
        String year1 = vertexStorage.get(i).year;
        if (year1.length() == 1)
        {
          min = 0;
          max= 100;
        }
        else if (year1.length() ==2)
        {
          min = 0;
          max= 100;
        }
        else if (year1.length() ==3)
        {
          String firstChar = year1.substring(0,1);
          firstChar += "00";
          min = Integer.valueOf(firstChar);
          max= min + 100;        
        }
         else if (year1.length() ==4)
        {
          String firstChar = year1.substring(0,1);
          firstChar += "000";
          min = Integer.valueOf(firstChar);

          max= min + 1000;
        }
        else
        {
          break;
        }    
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String year2 = vertexStorage.get(j).year;
            if (!year2.equals("unknown"))
            {
              int year2Int = Integer.valueOf(year2);
              if(year2Int < max && year2Int >= min){
                value.add(vertexStorage.get(j));
              }
            }
            else
            {
              break;
            }
          }
        }
        adjList.put(i, value);
      }
    }
  }
  void addEdgeTitle(){
    //PSEUDOCODE: Comparing Titles that match keywords
    //maybe change the painting name to be String[] nameArray = split(painting Title, " ");
  
  }
  void addEdgeYear(){
  
  }
 //DEBUG
  void printAdjList(){
    println(adjList.size());
    for(int i = 0; i < adjList.size(); i++){
      println("Adjacency List of Vertex: " + i);
      for (int j = 0; j < adjList.get(i).size(); j++) {
         println(" -> "+adjList.get(i).get(j).hue1);
      }
    }
  }
  //graphDraw: draws the graph w/ vertices + edges
  void graphDraw(){
  }
}
