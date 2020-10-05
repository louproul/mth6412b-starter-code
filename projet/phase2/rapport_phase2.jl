### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 8dfdc2b0-0753-11eb-01f6-07c8c6e87bb2
using PlutoUI

# ╔═╡ 52d487ce-06a6-11eb-2482-dd65e447df8d
begin
include("../node.jl")
include("../edge.jl")
include("../graph.jl")
include("../read_stsp.jl")
include("../disjoint_set.jl")
end

# ╔═╡ 443ad950-06a5-11eb-1ebf-9fed2a75fa07
md" # Rapport de projet: Phase 2"

# ╔═╡ 58c70d70-06a6-11eb-2ce1-253886b97427
md" Équipe: Elahe Amiri et Louis-Philippe Proulx"

# ╔═╡ 47bbcd40-06a6-11eb-32bd-2b3bc3b16626
md"Lien Github du code: [Branche Phase 2 du projet](https://github.com/louproul/mth6412b-starter-code.git)"

# ╔═╡ 0f31526e-0754-11eb-001f-df6b7cf78cf9


# ╔═╡ ebb78e00-0752-11eb-1b0a-43cfa0521da7
begin
Ex_Graph = Graph("Graph_Ex_Notes_de_Cours", Node{Array{Float64,1}}[], Edge{Array{Float64,1}}[])
my_node_dict = Dict{String,Any}()
for node_name in ["a","b","c","d","e","f","g","h","i"]
	my_node_dict[node_name]=Node{Array{Float64,1}}(node_name,[])
	add_node!(Ex_Graph,my_node_dict[node_name])
end
add_edge!(Ex_Graph,Edge("(a,b)",4.0,(my_node_dict["a"],my_node_dict["b"])))
add_edge!(Ex_Graph,Edge("(a,h)",8.0,(my_node_dict["a"],my_node_dict["h"])))
add_edge!(Ex_Graph,Edge("(b,c)",8.0,(my_node_dict["b"],my_node_dict["c"])))
add_edge!(Ex_Graph,Edge("(b,h)",11.0,(my_node_dict["b"],my_node_dict["h"])))
add_edge!(Ex_Graph,Edge("(c,d)",7.0,(my_node_dict["c"],my_node_dict["d"])))
add_edge!(Ex_Graph,Edge("(c,f)",4.0,(my_node_dict["c"],my_node_dict["f"])))
add_edge!(Ex_Graph,Edge("(c,i)",2.0,(my_node_dict["c"],my_node_dict["i"])))
add_edge!(Ex_Graph,Edge("(d,e)",9.0,(my_node_dict["d"],my_node_dict["e"])))
add_edge!(Ex_Graph,Edge("(d,f)",14.0,(my_node_dict["d"],my_node_dict["f"])))
add_edge!(Ex_Graph,Edge("(e,f)",10.0,(my_node_dict["e"],my_node_dict["f"])))
add_edge!(Ex_Graph,Edge("(f,g)",2.0,(my_node_dict["f"],my_node_dict["g"])))
add_edge!(Ex_Graph,Edge("(g,h)",1.0,(my_node_dict["g"],my_node_dict["h"])))
add_edge!(Ex_Graph,Edge("(g,i)",6.0,(my_node_dict["g"],my_node_dict["i"])))
add_edge!(Ex_Graph,Edge("(h,i)",7.0,(my_node_dict["h"],my_node_dict["i"])))
end

# ╔═╡ 2cd338b0-06a6-11eb-3e54-0ff9884b75ac
begin
my_disjoint_set_toy = DisjointSet{Vector{Float64}}()
create_disjointSet!(my_disjoint_set_toy, Ex_Graph)
end

# ╔═╡ 6fc4caa0-0753-11eb-0335-c52b7f54c11d
A = sort(Ex_Graph.edges, by = x -> x.weight)

# ╔═╡ c806f030-0753-11eb-34b1-4b2a0ebce572
for a in A
  if is_arc_disjoint(my_disjoint_set_toy,a)
    union_disjoint_set(my_disjoint_set_toy, a )
  end
end

# ╔═╡ db7f11b0-0753-11eb-29c4-0df72443d55a
sum(x->x.weight,edges(my_disjoint_set_toy))

# ╔═╡ 578a97c0-0754-11eb-3d8d-210e61eded8f
begin
Main_Graph = Graph{Vector{Float64}}() 
graph_nodes, graph_edges, edges_weight = read_stsp("../../instances/stsp/bayg29.tsp")
create_graph!(Main_Graph, graph_nodes,graph_edges, edges_weight)
end

# ╔═╡ b368a8c0-0754-11eb-367b-438a97e2490f
begin
A1 = sort(Main_Graph.edges, by = x -> x.weight)
my_disjoint_set = DisjointSet{Vector{Float64}}()
create_disjointSet!(my_disjoint_set, Main_Graph)
end

# ╔═╡ 4cf56fa0-0755-11eb-2bc7-0f622b8a44f0


# ╔═╡ d0011030-0754-11eb-2042-c597142a89c6
for a in A1
  if is_arc_disjoint(my_disjoint_set,a)
    union_disjoint_set(my_disjoint_set, a )
  end
end

# ╔═╡ d8c10db0-0754-11eb-01f3-a10b0747e5e1
plot_subgraph(Main_Graph, edges(my_disjoint_set))

# ╔═╡ ddb33a50-0754-11eb-36ac-1909ab268a31
sum(x->x.weight,edges(my_disjoint_set))

# ╔═╡ f59f57c0-0754-11eb-1ed3-f1391c18bc0d
edges(my_disjoint_set)

# ╔═╡ 00577bc0-0755-11eb-0d6f-2da3cf6d3820
nodes(my_disjoint_set)

# ╔═╡ 0b020b30-0755-11eb-3638-934b4887c04a


# ╔═╡ fd259cc0-0754-11eb-3951-b14121224ea1


# ╔═╡ cb353040-0754-11eb-095c-0d40620d687d


# ╔═╡ ac9e60c0-0754-11eb-2e39-8715f8afac57


# ╔═╡ 920c9ec0-0754-11eb-3f9b-8bfe8a58ccd2


# ╔═╡ 007ad7b2-0754-11eb-3db2-99bba1eeb520


# ╔═╡ fcb40bb0-0753-11eb-12fa-47d70b57363d


# ╔═╡ e79d0740-0753-11eb-2a29-ad784227b37a


# ╔═╡ d2613cc0-0753-11eb-1778-1db5696ad749


# ╔═╡ Cell order:
# ╟─443ad950-06a5-11eb-1ebf-9fed2a75fa07
# ╟─58c70d70-06a6-11eb-2ce1-253886b97427
# ╟─47bbcd40-06a6-11eb-32bd-2b3bc3b16626
# ╠═52d487ce-06a6-11eb-2482-dd65e447df8d
# ╠═8dfdc2b0-0753-11eb-01f6-07c8c6e87bb2
# ╠═0f31526e-0754-11eb-001f-df6b7cf78cf9
# ╠═ebb78e00-0752-11eb-1b0a-43cfa0521da7
# ╠═2cd338b0-06a6-11eb-3e54-0ff9884b75ac
# ╠═6fc4caa0-0753-11eb-0335-c52b7f54c11d
# ╠═c806f030-0753-11eb-34b1-4b2a0ebce572
# ╠═db7f11b0-0753-11eb-29c4-0df72443d55a
# ╠═578a97c0-0754-11eb-3d8d-210e61eded8f
# ╠═b368a8c0-0754-11eb-367b-438a97e2490f
# ╠═4cf56fa0-0755-11eb-2bc7-0f622b8a44f0
# ╠═d0011030-0754-11eb-2042-c597142a89c6
# ╠═d8c10db0-0754-11eb-01f3-a10b0747e5e1
# ╠═ddb33a50-0754-11eb-36ac-1909ab268a31
# ╠═f59f57c0-0754-11eb-1ed3-f1391c18bc0d
# ╠═00577bc0-0755-11eb-0d6f-2da3cf6d3820
# ╠═0b020b30-0755-11eb-3638-934b4887c04a
# ╠═fd259cc0-0754-11eb-3951-b14121224ea1
# ╠═cb353040-0754-11eb-095c-0d40620d687d
# ╠═ac9e60c0-0754-11eb-2e39-8715f8afac57
# ╠═920c9ec0-0754-11eb-3f9b-8bfe8a58ccd2
# ╠═007ad7b2-0754-11eb-3db2-99bba1eeb520
# ╠═fcb40bb0-0753-11eb-12fa-47d70b57363d
# ╠═e79d0740-0753-11eb-2a29-ad784227b37a
# ╠═d2613cc0-0753-11eb-1778-1db5696ad749
