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
	filepath = "c:\\Users\\lppro\\OneDrive\\Documents\\Poly\\Cours\\MTH6412B\\code\\project\\mth6412b-starter-code\\instances\\stsp\\"
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

# ╔═╡ 3d2bad10-00e7-11eb-383b-5b97be2d9f26
Node("18",graph_nodes[18])

# ╔═╡ f7244800-00db-11eb-1153-c3ed8515bf31
begin
	for (k, v) in graph_nodes
		push!(Nodes,Node(string(k),v))
	end
end

# ╔═╡ 27e84270-00dc-11eb-1264-3bde81f1f815
Nodes

# ╔═╡ 11aa7bd0-00dd-11eb-250a-673e7c88ac11
Edge("test",(Nodes[1], Nodes[2]),parse(Int,edges_weight[1,2]))

# ╔═╡ 27c87d10-00ea-11eb-232c-c3a8b25f4cf3
Nodes[findfirst(x -> x.name == string(1),Nodes)]

# ╔═╡ 39d75c80-00e8-11eb-1667-db4d90329d47
for i in eachindex(graph_edges)
	index_1 = findfirst(x -> x.name == string(i),Nodes)
	for j in graph_edges[i]
	index_2 = findfirst(x -> x.name == string(j),Nodes)	
		push!(Edges,Edge("test",(Nodes[index_1],Nodes[index_2]),parse(Int,edges_weight[i,j])))
	end
end

# ╔═╡ 91b20eb0-00dd-11eb-3c54-8b9b004e94e8
Edges

# ╔═╡ 6d4fc460-00ef-11eb-1e8b-b558dfaed82d
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
# ╠═3d2bad10-00e7-11eb-383b-5b97be2d9f26
# ╠═f7244800-00db-11eb-1153-c3ed8515bf31
# ╠═27e84270-00dc-11eb-1264-3bde81f1f815
# ╠═11aa7bd0-00dd-11eb-250a-673e7c88ac11
# ╠═27c87d10-00ea-11eb-232c-c3a8b25f4cf3
# ╠═39d75c80-00e8-11eb-1667-db4d90329d47
# ╠═91b20eb0-00dd-11eb-3c54-8b9b004e94e8
# ╠═6d4fc460-00ef-11eb-1e8b-b558dfaed82d
