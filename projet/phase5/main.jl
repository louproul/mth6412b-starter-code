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
filepath_to_stsp = "instances\\tsp\\instances"
filepath = joinpath(root, filepath_to_stsp) 
filepath = joinpath(filepath, filename_stsp * ".tsp") 

"""Reading data form data files"""
header = read_img_header(filepath)

graph_nodes, graph_edges, edges_weight = read_img_stsp(filepath)

"""Creating the marked Graph form the data"""

Main_Graph = MarkedGraph("Graph_image", MarkedNode{Array{Float64,1}}[], MarkedEdge{Array{Float64,1}}[]) 
create_img_Graph!(Main_Graph, graph_nodes, graph_edges, edges_weight)

W2, HK_Graph = HK_MST(Main_Graph, 1, Main_Graph.nodes[1], 3, 10) # method::Int64=0, t_step::Float64 = -1.0, stop_method::Int64 = 0)
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
inputpath_to_shuffle_image = joinpath(inputpath, filename_stsp * ".png") 
path_reconstructed_image = joinpath(normpath(joinpath(@__FILE__,"..")),"tour_and_reconstructed_image", "construted_" * filename_stsp * ".png") 

reconstruct_picture(path_name_tour, inputpath_to_shuffle_image, path_reconstructed_image; view = true)





instances_name = dict()
instances_name["abstract-light-painting"] = 12314767
instances_name["alaska-railroad"] = 7667914
instances_name["blue-hour-paris"] = 3946200
instances_name["lower-kananaskis-lake"] = 4226754
instances_name["marlet2-radio-board"] = 8863246
instances_name["nikos-cat"] = 3036676
instances_name["pizza-food-wallpaper"] = 5041336
instances_name["the-enchanted-garden"] = 19914400
instances_name["tokyo-skytree-aerial"] = 13610038


reconstruct_image("abstract-light-painting") 
reconstruct_image("alaska-railroad")
reconstruct_image("blue-hour-paris")
reconstruct_image("lower-kananaskis-lake")
reconstruct_image("marlet2-radio-board") 
#reconstruct_image("nikos-cat")
reconstruct_image("pizza-food-wallpaper")
reconstruct_image("the-enchanted-garden")
reconstruct_image("tokyo-skytree-aerial")



#write_tour("lower-kananaskis-lake.tour", node_tour, convert(Float32, W2))
conver_TSP_to_img(New_TSP ,"lower-kananaskis-lake.tour")
reconstruct_picture("lower-kananaskis-lake.tour", inputpath, "constructed_lower-kananaskis-lake.png"; view = true)
