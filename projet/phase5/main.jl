using Markdown
using InteractiveUtils

include("../node.jl")
include("../edge.jl")
include("../graph.jl")

include("../phase3/marked_node.jl")
include("../phase3/marked_edge.jl")
include("../phase3/marked_graph.jl")
include("../phase3/Prime_Alg.jl")
include("../phase3/kruskal_Alg.jl")

include("../phase4/one_tree.jl")
include("../phase4/TSP_hk.jl")
include("../phase4/TSP_rsl.jl")

include("read_stsp_new.jl")
include("tools.jl")


filename_stsp = "lower-kananaskis-lake.tsp"
root = normpath(joinpath(@__FILE__,"..","..",".."))
filepath_to_stsp = "instances\\img_stsp"
filepath = joinpath(root, filepath_to_stsp) 
filepath = joinpath(filepath, filename_stsp) 

"""Reading data form data files"""
header = read_img_header(filepath)

graph_nodes, graph_edges, edges_weight = read_img_stsp(filepath)

"""Creating the marked Graph form the data"""

Main_Graph = MarkedGraph("Graph_image", MarkedNode{Array{Float64,1}}[], MarkedEdge{Array{Float64,1}}[]) 
create_img_Graph!(Main_Graph, graph_nodes, graph_edges, edges_weight)

W2, HK_Graph = HK_MST(Main_Graph, 2, Main_Graph.nodes[1], 3, 10) # method::Int64=0, t_step::Float64 = -1.0, stop_method::Int64 = 0)
println("The weight of TSP using HK algorithm: ", W2)

New_TSP, new_W = create_tour!(deepcopy(HK_Graph), Main_Graph, W2)
println("The weight of TSP Tour: ", new_W)


#Improved_W = Improve_path!(New_TSP, Main_Graph, new_W)
#println("The final weight of TSP Tour: ", Improved_W)

#start_e = New_TSP.edges[findall(x->x.adjacentnodes[1].name == "1", New_TSP.edges)][1]
#Edge_list = create_touredge_list!(New_TSP, start_e)
#node_tour = Tour_nodes_list(New_TSP)

input_img = "lower-kananaskis-lake.png"
inputpath_to_stsp = "images\\shuffled"
inputpath = joinpath(root, inputpath_to_stsp) 
inputpath = joinpath(inputpath, input_img) 

#write_tour("lower-kananaskis-lake.tour", node_tour, convert(Float32, W2))
conver_TSP_to_img(New_TSP ,"lower-kananaskis-lake.tour")
reconstruct_picture("lower-kananaskis-lake.tour", inputpath, "constructed_lower-kananaskis-lake.png"; view = true)
