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
include("reconstruct_img.jl")



instances_name = Dict()
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
reconstruct_image("nikos-cat")
reconstruct_image("pizza-food-wallpaper")
reconstruct_image("the-enchanted-garden")
reconstruct_image("tokyo-skytree-aerial")


