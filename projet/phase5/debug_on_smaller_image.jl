using Markdown
using InteractiveUtils
using Random, FileIO, Images, ImageView, ImageMagick

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




filepath_in = joinpath(normpath(joinpath(@__FILE__,"..","..","..")),"instances\\images\\original", "alaska-railroad.png") 
filepath_out = joinpath(normpath(joinpath(@__FILE__,"..","..","..")),"instances\\images\\shuffled", "alaska-railroad.png") 

score_init = score_picture(filepath_in)
println("Image intiale score:",score_init)
score_after = score_picture(filepath_out)
println("Shuffled image score:",score_after)


# filepath_in = joinpath(@__FILE__,"..", "alaska-railroad_debug.png") 
# filepath_out = joinpath(@__FILE__,"..", "alaska-railroad_debug_shuffled.png") 

# score_init = score_picture(filepath_in)
# println("Image intiale score:",score_init)

# my_permutation = []
# shuffle_picture(filepath_in, filepath_out; view=true)
# score_after = score_picture(filepath_out)
# println("Shuffled image score:",score_after)