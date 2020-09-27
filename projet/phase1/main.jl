using Markdown
using InteractiveUtils

include("node.jl")
include("graph.jl")
include("edge.jl")
include("read_stsp.jl")

md"# ___Rapport MTH6412B___"

filename_stsp = "bayg29.tsp"
filepath = "D:\\Courses\\MTH6412B\\Project\\mth6412b-starter-code\\instances\\stsp\\"
filepath = joinpath(filepath, filename_stsp) 

header = read_header(filepath)

graph_nodes, graph_edges, edges_weight = read_stsp(filepath)


Main_Graph = Graph("Graph_"*header["NAME"], Node{Array{Float64,1}}[], Edge{Array{Float64,1}}[]) 

for k = 1 : length(graph_edges)
    new_node1 = Node(string(k),graph_nodes[k])
    add_node!(Main_Graph, new_node1)
    for j in graph_edges[k]
        new_node2 = Node(string(j),graph_nodes[j])
        edge_name = "("*string(k)*","*string(j)*")"
        new_edge = Edge(edge_name, edges_weight[k,j], (new_node1 , new_node2))
        add_edge!(Main_Graph, new_edge)
    end
end

gr()
using Plots
plot_graph(filepath)

show(Main_Graph)