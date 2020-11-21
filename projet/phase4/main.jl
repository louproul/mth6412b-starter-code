using Markdown
using InteractiveUtils

include("../node.jl")
include("../edge.jl")
include("../graph.jl")
include("../read_stsp.jl")

include("../phase3/marked_node.jl")
include("../phase3/marked_edge.jl")
include("../phase3/marked_graph.jl")
include("../phase3/Prime_Alg.jl")
include("../phase3/kruskal_Alg.jl")

include("TSP_rsl.jl")


filename_stsp = "bayg29.tsp"
root = normpath(joinpath(@__FILE__,"..","..",".."))
filepath_to_stsp = "instances\\stsp"
filepath = joinpath(root, filepath_to_stsp) 
filepath = joinpath(filepath, filename_stsp) 

"""Reading data form data files"""
header = read_header(filepath)

graph_nodes, graph_edges, edges_weight = read_stsp(filepath)

"""Creating the marked Graph form the data"""

Main_Graph = MarkedGraph("Graph_"*header["NAME"], MarkedNode{Array{Float64,1}}[], MarkedEdge{Array{Float64,1}}[]) 
create_MarkedGraph!(Main_Graph, graph_nodes, graph_edges, edges_weight)

W1, TSP_Graph = RSL_TSP(Main_Graph, Main_Graph.nodes[1])
println("The weight of TSP using Rosenkrantz, Stearns and Lewis algorithm: ", W1)
plot_markedgraph(TSP_Graph)


