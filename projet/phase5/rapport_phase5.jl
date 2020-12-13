### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 2af41e20-3d7d-11eb-200d-91bfbcb79a97
using Random, FileIO, Images, ImageView, ImageMagick

# ╔═╡ 1eaed3d0-3d64-11eb-332c-eb82da38927e
begin
include("../display.jl")
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
end

# ╔═╡ 5add1620-3d62-11eb-0b3b-e7330edf7a66
md" # Rapport de projet: Phase 5"

# ╔═╡ 1ec02e60-3d63-11eb-3a85-f729b432454e
md" Équipe: Elahe Amiri et Louis-Philippe Proulx"

# ╔═╡ 263e8420-3d63-11eb-03ad-71629e8d52a4
md"Lien Github du code: [Branche Phase 5 du projet](https://github.com/louproul/mth6412b-starter-code.git)"

# ╔═╡ 3d253f80-3d63-11eb-2259-b91a9c35e95f
md" Il y a une réplique du code dans \"projet\phase5\main.jl\""

# ╔═╡ 48773282-3d63-11eb-3446-51a601da3cd8
md" Toute les combinaisons sont testés \"projet\phase5\best_parameters_search.jl\""

# ╔═╡ 59a42b82-3d63-11eb-22ea-0153e935a154
md" ## Voici la fonction principale qui permet de créeer les images reconstruites"

# ╔═╡ 192aee80-3d64-11eb-0189-21f8f2bd2b23
display("reconstruct_img.jl",22,59)

# ╔═╡ 72c30620-3d6f-11eb-029e-179314b7d3b0
md"### Example abstract-light-painting"

# ╔═╡ 9f523e40-3d74-11eb-0774-21a069b407f3
reconstruct_image("abstract-light-painting",true, 1, 4, 10) 

# ╔═╡ 64f44f20-3d76-11eb-3e64-5ba8acd697ff
function path_to_original_and_constructed(filename_stsp)
	root = normpath(joinpath(@__FILE__,"..","..",".."))
	inputpath_to_stsp = "instances\\images\\original"
	inputpath = joinpath(root, inputpath_to_stsp)
    inputpath_to_original_image = joinpath(inputpath, filename_stsp * ".png") 
    path_reconstructed_image = 		              joinpath(normpath(joinpath(@__FILE__,"..")),"tour_and_reconstructed_image", 	   "construted_" * filename_stsp * ".png")
	return(inputpath_to_original_image,path_reconstructed_image)
end

# ╔═╡ 3f21ff40-3d76-11eb-38f1-bfcef25826be
(original_image,reconstructed_image)=path_to_original_and_constructed("abstract-light-painting")

# ╔═╡ 0f4c7f50-3d7d-11eb-06c1-ef19431b6e49
imshow(load(reconstructed_image))

# ╔═╡ 87cf53d0-3d7d-11eb-3ab2-a33f4eb97de2
begin
subplot(2,1,1)
imshow(load(reconstructed_image))
subplot(2,1,2)
imshow(load(original_image))
end

# ╔═╡ Cell order:
# ╠═5add1620-3d62-11eb-0b3b-e7330edf7a66
# ╠═1ec02e60-3d63-11eb-3a85-f729b432454e
# ╠═263e8420-3d63-11eb-03ad-71629e8d52a4
# ╠═3d253f80-3d63-11eb-2259-b91a9c35e95f
# ╠═48773282-3d63-11eb-3446-51a601da3cd8
# ╠═2af41e20-3d7d-11eb-200d-91bfbcb79a97
# ╠═1eaed3d0-3d64-11eb-332c-eb82da38927e
# ╠═59a42b82-3d63-11eb-22ea-0153e935a154
# ╠═192aee80-3d64-11eb-0189-21f8f2bd2b23
# ╠═72c30620-3d6f-11eb-029e-179314b7d3b0
# ╠═9f523e40-3d74-11eb-0774-21a069b407f3
# ╠═64f44f20-3d76-11eb-3e64-5ba8acd697ff
# ╠═3f21ff40-3d76-11eb-38f1-bfcef25826be
# ╠═0f4c7f50-3d7d-11eb-06c1-ef19431b6e49
# ╠═87cf53d0-3d7d-11eb-3ab2-a33f4eb97de2
