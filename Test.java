public class Test {
///!astar_def
	public static <V extends DijkstraExercise.Vertex, E extends DijkstraExercise.Edge> double astar(ADGraph<V, E> G, Integer s, Integer t, ArrayList<Integer> path, MyPriorityQueue Q) {
		return genericAStar(G, s, t, path, Q, (node, target) -> Math.sqrt(Math.pow(G.x(target) - G.x(node), 2) + Math.pow(G.y(target) - G.y(node), 2)));
	}
///!dijkstra_def
	public static <V extends DijkstraExercise.Vertex, E extends DijkstraExercise.Edge> double dijkstra(ADGraph<V, E> G, Integer s, Integer t, ArrayList<Integer> path, MyPriorityQueue Q) {
		return genericAStar(G, s, t, path, Q, (node, target) -> 0.0);
	}
///!generic_astar_stub
	private static <V extends DijkstraExercise.Vertex, E extends DijkstraExercise.Edge> double genericAStar(ADGraph<V, E> G, Integer s, Integer t, ArrayList<Integer> path, MyPriorityQueue Q, AStarEstimate est) {
///!generic_astar_init
		double[] cost = new double[G.numVertices()];
		int[] via = new int[G.numVertices()];

		for (int i = 0; i < G.numVertices(); i++) {
			Q.add(i, Integer.MAX_VALUE);
			via[i] = -1;
		}
		Q.decreaseKey(s, 0);
///!generic_astar_loop
		while (true) {
			int u = Q.removeMin();
			if (u == t)
				break;
			for (int neighbor : G.outNeighbors(u)) {
				if (Q.contains(neighbor)) {
					if (Q.decreaseKey(neighbor, cost[u] + G.weight(u, neighbor) + est.estimate(neighbor, t))) {
						cost[neighbor] = cost[u] + G.weight(u, neighbor);
						via[neighbor] = u;
					}
				}
			}
		}
///!generic_astar_backtacking
		for (int id = t; id != -1; ) {
			path.add(0, id);
			id = via[id];
		}

		return cost[t];
///!generic_astar_stub
	}
///!astar_est
	private interface AStarEstimate {
		public double estimate(Integer node, Integer target);
	}
///!
}