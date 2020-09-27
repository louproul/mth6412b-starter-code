### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 5f71b5d0-00cf-11eb-067c-6f7fafd83b3f
begin
	include("node.jl")
	include("edge.jl")
	include("graph.jl")
	include("read_stsp.jl")
end

# ╔═╡ 396f4ab0-00ce-11eb-291f-cd5630db2bb7
md"# Rapport de projet: Phase 1"

# ╔═╡ a238b362-00ce-11eb-06bf-dbf6dce7add9
md" Équipe: Elahe Amiri et Louis-Philippe Proulx"

# ╔═╡ c4749610-00ce-11eb-1a2f-8f0e60e9c0a2
md"Lien Github du code: [Branche Phase 1 du projet](https://www.google.com)"

# ╔═╡ 07312170-00d0-11eb-2214-5f83463faa58
begin
	filename_stsp = "bayg29.tsp"
	root = normpath(joinpath(@__FILE__,"..","..",".."))
	filepath_to_stsp = "instances\\stsp"
	filepath = joinpath(root, filepath_to_stsp) 
	filepath = joinpath(filepath, filename_stsp) 
end

# ╔═╡ 1734aa10-00da-11eb-297e-fd626ae614e5
graph_nodes, graph_edges, edges_weight = read_stsp(filepath)

# ╔═╡ 3e2e1e60-00e6-11eb-1fdc-d5ceafc8de0b
Nodes = Node{Array{Float64,1}}[]

# ╔═╡ d9f48190-00e6-11eb-2871-3f3c078263fc
Edges = Edge{Array{Float64,1}}[]

# ╔═╡ b1329a90-00e0-11eb-1d3f-c9999ef689d7
my_graph = Graph(filename_stsp,Nodes,Edges)

# ╔═╡ 279400c0-0104-11eb-30f2-23b812fd577f
for k = 1 : length(graph_edges)
    new_node1 = Node(string(k),graph_nodes[k])
    add_node!(my_graph, new_node1)
    for j in graph_edges[k]
        new_node2 = Node(string(j),graph_nodes[j])
        edge_name = "("*string(k)*","*string(j)*")"
        new_edge = Edge(edge_name, edges_weight[k,j], (new_node1 , new_node2))
        add_edge!(my_graph, new_edge)
    end
end

# ╔═╡ 47199d10-0104-11eb-169d-6f9131a923ba
my_graph

# ╔═╡ Cell order:
# ╠═396f4ab0-00ce-11eb-291f-cd5630db2bb7
# ╠═a238b362-00ce-11eb-06bf-dbf6dce7add9
# ╠═c4749610-00ce-11eb-1a2f-8f0e60e9c0a2
# ╠═5f71b5d0-00cf-11eb-067c-6f7fafd83b3f
# ╠═07312170-00d0-11eb-2214-5f83463faa58
# ╠═1734aa10-00da-11eb-297e-fd626ae614e5
# ╠═3e2e1e60-00e6-11eb-1fdc-d5ceafc8de0b
# ╠═d9f48190-00e6-11eb-2871-3f3c078263fc
# ╠═b1329a90-00e0-11eb-1d3f-c9999ef689d7
# ╠═279400c0-0104-11eb-30f2-23b812fd577f
# ╠═47199d10-0104-11eb-169d-6f9131a923ba
