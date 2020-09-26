### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ f6a951e0-fffa-11ea-2b9d-59e9690d4fbd
begin
	include("node.jl")
	include("graph.jl")
	include("read_stsp.jl")
end

# ╔═╡ bdb4c8b0-fffa-11ea-2269-4b812f78aee9
md"# _Rapport MTH6412B_"

# ╔═╡ 296a7be0-fffb-11ea-2866-53efd7c41245
begin
	filename_stsp = "bayg29.tsp"
	filepath = "c:\\Users\\lppro\\OneDrive\\Documents\\Poly\\Cours\\MTH6412B\\code\\project\\mth6412b-starter-code\\instances\\stsp\\"
	filepath = joinpath(filepath, filename_stsp) 
end

# ╔═╡ 69cb3260-fffb-11ea-02c2-9531ad3fcc63
graph_nodes, graph_edges = read_stsp(filepath)

# ╔═╡ 7a34db62-fffb-11ea-3e32-b3ab3e1995e0
plot_graph(graph_nodes, graph_edges)

# ╔═╡ 977123ee-fffb-11ea-38f8-a9e35f8c63c3


# ╔═╡ ec64d740-fffa-11ea-3613-c5580a95483c


# ╔═╡ Cell order:
# ╠═bdb4c8b0-fffa-11ea-2269-4b812f78aee9
# ╠═f6a951e0-fffa-11ea-2b9d-59e9690d4fbd
# ╠═296a7be0-fffb-11ea-2866-53efd7c41245
# ╠═69cb3260-fffb-11ea-02c2-9531ad3fcc63
# ╠═7a34db62-fffb-11ea-3e32-b3ab3e1995e0
# ╠═977123ee-fffb-11ea-38f8-a9e35f8c63c3
# ╠═ec64d740-fffa-11ea-3613-c5580a95483c
