using Markdown
using InteractiveUtils

include("../node.jl")
include("../edge.jl")
include("../graph.jl")
include("../read_stsp.jl")

include("../marked_node.jl")
include("../marked_edge.jl")
include("../marked_graph.jl")
include("../Prime_Alg.jl")
include("../kruskal_Alg.jl")


# preorder tree walk (Depth first search)
function preorder_path(Tree::MarkedGraph{T}, V::MarkedNode{T}, Node_order::Array{MarkedNode{Array{Float64,1}},1}) where T  
    set_visited!(V)
    push!(Node_order, V)
    for adj in sort(collect(V.adjacents), by=x->x[2])
        U = Tree.nodes[findfirst(x->x.name == string(adj[1]), Tree.nodes)]
        if U.visited == false
            preorder_path(Tree, U, Node_order)
        end
    end
    for node in Tree.nodes
        if node.visited == false
            preorder_path(Tree, node, Node_order)
        end
    end
    return Node_order

end

# function of Rosenkrantz, Stearns and Lewis algorithm
function RSL_TSP(Graph::MarkedGraph{T}, Source::MarkedNode{T}) where T  
    """Calculating the minimum spanning tree using Prim algorithm"""
    W1, Prime_MST = Prime_Algo(Graph, Source)
    W = 0.0
    Node_order = MarkedNode{Array{Float64,1}}[]

    for node in Prime_MST.nodes
        node.visited = false
    end
    preorder_path(Prime_MST, Source, Node_order)
    TSP_nodes = deepcopy(Node_order)
    TSP_Graph = MarkedGraph("TSPGraph_", TSP_nodes, MarkedEdge{Array{Float64,1}}[]) 
    empty!(TSP_nodes[1].adjacents)
    for i in 1:length(TSP_nodes)-1
        empty!(TSP_nodes[i+1].adjacents)
        edge_name = "("*TSP_nodes[i].name*","*TSP_nodes[i+1].name*")"
        # finding the weight of edge in the graph
        try
            edge_weight = Graph.edges[findfirst(x->x.name == edge_name, Graph.edges)].weight
        catch
            edge_name2 = "("*TSP_nodes[i+1].name*","*TSP_nodes[i].name*")"
            edge_weight = Graph.edges[findfirst(x->x.name == edge_name2, Graph.edges)].weight
        end
        W = W + edge_weight
        new_edge = MarkedEdge(edge_name, edge_weight, (TSP_nodes[i] , TSP_nodes[i+1]))   
        add_adj_node!(TSP_nodes[i], TSP_nodes[i+1], edge_weight)
        add_markededge!(TSP_Graph, new_edge)
    end
    edge_name = "("*TSP_nodes[length(TSP_nodes)].name*","*TSP_nodes[1].name*")"
    try
        edge_weight = Graph.edges[findfirst(x->x.name == edge_name, Graph.edges)].weight
    catch
        edge_name2 = "("*TSP_nodes[1].name*","*TSP_nodes[length(TSP_nodes)].name*")"
        edge_weight = Graph.edges[findfirst(x->x.name == edge_name2, Graph.edges)].weight
    end
    W = W + edge_weight
    new_edge = MarkedEdge(edge_name, edge_weight, (TSP_nodes[length(TSP_nodes)] , TSP_nodes[1]))
    add_adj_node!(TSP_nodes[length(TSP_nodes)], TSP_nodes[1], edge_weight)    
    return W, TSP_Graph
end