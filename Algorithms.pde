abstract class Algorithms{
  Graph graph;

  void runAlgorithm(){

  }
}
//TODO: Set this.graph to graph being passed in, and create each algorithm
//Output: Painting names in console + how long the algorithm took to run
class BFS extends Algorithms{
  //Print out in console the painting title thoruhg BFS
  BFS(Graph graph){
    this.graph = graph;

  }
    void runAlgorithm(){

/*
      boolean visited[] = new boolean[graph.vertexStroage.size()];
      //int a =0;
      Queue<Integer> q = new ArrayDeque();
      for (int i = 0; i < graph.numVertices() ; i++)
      {
        if(visited[i] != true)
        {
        q.add(i);
        visited[i]= true;
        }
        else
        {
          continue;
        }
      
        while(!q.isEmpty())
        {
          a = q.poll();
          System.out.print(graph.vertexStorage.get(a).title  + " ");

        }
        
*/
      }
      
}
class DFS extends Algorithms{
    boolean[] visited;
    DFS(Graph graph){
      this.graph = graph;
      visited = new boolean[graph.numVertices];
    }

    void runAlgorithm(){
      DFSRecur(0, visited);
    }
    void DFSRecur(int source, boolean[] visited){      
      visited[source] = true;
      println(graph.vertexStorage.get(source).title);

      Iterator<Vertex> iter = graph.adjList.get(source).iterator();
      while(iter.hasNext()){
        Vertex n = iter.next();
        int index = 0;
        //Find corresponding index to the vertex
        for(int i = 0; i < graph.numVertices; i++){
          if(n.title == graph.vertexStorage.get(i).title){
            index = i;
            break;
          }
        }
        if(!visited[index]){
          DFSRecur(index, visited);
        }
      }
    }
}
class Dijkstra extends Algorithms{
  Dijkstra(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){

  }
}
