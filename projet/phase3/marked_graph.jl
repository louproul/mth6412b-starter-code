import Base.show
include("marked_node.jl")
include("marked_edge.jl")


"""Type representant un graphe comme un ensemble de noeuds.

"""
mutable struct MarkedGraph{T} <: AbstractGraph{T}
  name::String
  nodes::Vector{MarkedNode{T}}
  edges::Vector{MarkedEdge{T}}
end

"""Let's you instanciate an empty graph"""
MarkedGraph{T}() where T = MarkedGraph("", MarkedNode{T}[], MarkedEdge{T}[]) 

"""Adds a node to the graph."""
function add_markednode!(graph::MarkedGraph{T}, node::MarkedNode{T}) where T
  push!(graph.nodes, node)
  graph
end


"""Adds an edge to the graph."""
function add_markededge!(graph::MarkedGraph{T} where T, edge::MarkedEdge{T} where T) 
  push!(graph.edges, edge)
  graph
end



function create_MarkedGraph!(graph::MarkedGraph, graph_nodes::Dict{Int64,Vector{Float64}},graph_edges::Array{Any,1}, edges_weight::Dict{Tuple{Int64,Int64},Float64})
    T = valtype(graph_nodes)
    for k = 1 : length(graph_edges)
        if isempty(graph_nodes)
            new_node1 = MarkedNode{T}(string(k), T(), false, Inf, nothing)
        else
            new_node1 = MarkedNode(string(k), graph_nodes[k], false, Inf, nothing)
        end
        add_markednode!(graph, new_node1)
        for j in graph_edges[k]
            if isempty(graph_nodes)
                new_node2 = MarkedNode{T}(string(j), T(), false, Inf, nothing)
            else
                new_node2 = MarkedNode(string(j), graph_nodes[j], false, Inf, nothing)
            end
            edge_name = "("*string(k)*","*string(j)*")"
            new_edge = MarkedEdge(edge_name, edges_weight[k,j], (new_node1 , new_node2))
            add_markededge!(graph, new_edge)
        end
    end
end



function plot_markedgraph(graph::MarkedGraph)

    fig = plot(legend=false)
  
    # edge positions
    for edge in graph.edges
        plot!([edge.adjacentnodes[1].data[1], edge.adjacentnodes[2].data[1]],
        [edge.adjacentnodes[1].data[2], edge.adjacentnodes[2].data[2]],
            linewidth=1.5, alpha=0.75, color=:lightgray)
    end
  
    # node positions
    xys = graph.nodes
    x = [xy.data[1] for xy in xys]
    y = [xy.data[2] for xy in xys]
    scatter!(x, y)
  
    fig
  end