# OSM Route Planner Code Structure:

## `main()`
1. `ReadFile()`
2. RouteModel
   1. `FindClosestNode()`
   2. `Node`
      1. `FindNeighbors()`
      2. `distance()`
3. RoutePlanner
   1. `AStarSearch()`
   2. `while(open_list.size() > 0)`
      1. `NextNode()`
      2. If goal is found, call `ConstructFinalPath()`
      3. `AddNeighbors()`

### `AddNeighbors()`
1. Call `FindNeighbors()` on the current Node
2. For each neighbor of the current Node
   1. Set the parent of neighbor to the current
   2. Set `g` value to current `g` + `distance()` to current
   3. Set `h` value using `CalculateHValue()`
   4. Add neighbor to `open_list`
   5. Mark neighbor as visited