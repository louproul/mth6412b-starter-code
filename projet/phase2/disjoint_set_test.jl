using Test
include("../disjoint_set.jl")
include("../graph.jl")
include("../read_stsp.jl")

my_graph = Graph{Vector{Float64}}() #The type of data containted in a node is a vector, (x,y) coordinate
graph_nodes, graph_edges, edges_weight = read_stsp("instances/stsp/bayg29.tsp")
create_graph!(my_graph, graph_nodes,graph_edges, edges_weight)

my_disjoint_set = DisjointSet{Vector{Float64}}()
create_disjointSet!(my_disjoint_set, my_graph)

@test lenght(my_disjoint_set.dict_sets) == my_graph.nodes

