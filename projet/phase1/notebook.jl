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
graph_nodes[2].show

# ╔═╡ 5d0c2bf0-0029-11eb-2c37-a5a6954f45d2
node1 = Node("City 1",[100,200])

# ╔═╡ ea475400-0032-11eb-1283-436bb4c05c29
node1.name

# ╔═╡ 151c4b40-0033-11eb-2264-1dafb9b6158e
node1.data

# ╔═╡ 1874ec20-0033-11eb-27cf-05b16b5889b0
show(node1)

# ╔═╡ dccf96a0-0039-11eb-2538-e941a3ecb7a3


# ╔═╡ d62b4d30-0039-11eb-1c11-ed9f1813230a


# ╔═╡ 53de9400-0033-11eb-1568-9b8ceb952fa7
("Node ", name(node1), ", data: ", data(node1))

# ╔═╡ 934341d0-0034-11eb-1d83-173803b034c9
name(node1)

# ╔═╡ f285da92-0034-11eb-1550-a14d8019192f
 data(node1)

# ╔═╡ f67d5380-0034-11eb-015d-03101e4ed879


# ╔═╡ 90bf7d20-0034-11eb-3a9b-11f3fe05c14d


# ╔═╡ 825b4110-0034-11eb-016a-9f3e48bf0937


# ╔═╡ 4c31b430-0033-11eb-2f97-a74490026d07


# ╔═╡ 4497c01e-0033-11eb-310c-ed9d156fd6ea


# ╔═╡ 3ebfee70-0033-11eb-3eff-f7d33c9870d0


# ╔═╡ 30f9c720-0033-11eb-0dd9-e9872c44cbb2


# ╔═╡ 253d5280-0033-11eb-2ed8-9b5cd37ad48f


# ╔═╡ fde1ca90-0032-11eb-2460-7775aa0697dc
show(node1)

# ╔═╡ 04dce68e-0033-11eb-1428-259d68a05a41


# ╔═╡ 5849e8f0-0029-11eb-13cf-ed784a723417


# ╔═╡ 48a9aa70-0029-11eb-2a6f-cfb2d3a495fe


# ╔═╡ 413825f0-0029-11eb-3f62-4768451efa29


# ╔═╡ 39da2970-0029-11eb-0b2e-ede66d0d8372


# ╔═╡ 700cc8f0-0028-11eb-3230-7f78e6fe1446


# ╔═╡ 667f9060-0028-11eb-25bc-6bc6a2095f45


# ╔═╡ 3e2cd730-0028-11eb-1f80-6da40e2d4188


# ╔═╡ 1eef8e80-0028-11eb-2083-87b9ac940821


# ╔═╡ 15996b80-0028-11eb-0090-e328c7d6f30b


# ╔═╡ ec64d740-fffa-11ea-3613-c5580a95483c


# ╔═╡ Cell order:
# ╠═bdb4c8b0-fffa-11ea-2269-4b812f78aee9
# ╠═f6a951e0-fffa-11ea-2b9d-59e9690d4fbd
# ╠═296a7be0-fffb-11ea-2866-53efd7c41245
# ╠═69cb3260-fffb-11ea-02c2-9531ad3fcc63
# ╠═7a34db62-fffb-11ea-3e32-b3ab3e1995e0
# ╠═977123ee-fffb-11ea-38f8-a9e35f8c63c3
# ╠═5d0c2bf0-0029-11eb-2c37-a5a6954f45d2
# ╠═ea475400-0032-11eb-1283-436bb4c05c29
# ╠═151c4b40-0033-11eb-2264-1dafb9b6158e
# ╠═1874ec20-0033-11eb-27cf-05b16b5889b0
# ╠═dccf96a0-0039-11eb-2538-e941a3ecb7a3
# ╠═d62b4d30-0039-11eb-1c11-ed9f1813230a
# ╠═53de9400-0033-11eb-1568-9b8ceb952fa7
# ╠═934341d0-0034-11eb-1d83-173803b034c9
# ╠═f285da92-0034-11eb-1550-a14d8019192f
# ╠═f67d5380-0034-11eb-015d-03101e4ed879
# ╠═90bf7d20-0034-11eb-3a9b-11f3fe05c14d
# ╠═825b4110-0034-11eb-016a-9f3e48bf0937
# ╠═4c31b430-0033-11eb-2f97-a74490026d07
# ╠═4497c01e-0033-11eb-310c-ed9d156fd6ea
# ╠═3ebfee70-0033-11eb-3eff-f7d33c9870d0
# ╠═30f9c720-0033-11eb-0dd9-e9872c44cbb2
# ╠═253d5280-0033-11eb-2ed8-9b5cd37ad48f
# ╠═fde1ca90-0032-11eb-2460-7775aa0697dc
# ╠═04dce68e-0033-11eb-1428-259d68a05a41
# ╠═5849e8f0-0029-11eb-13cf-ed784a723417
# ╠═48a9aa70-0029-11eb-2a6f-cfb2d3a495fe
# ╠═413825f0-0029-11eb-3f62-4768451efa29
# ╠═39da2970-0029-11eb-0b2e-ede66d0d8372
# ╠═700cc8f0-0028-11eb-3230-7f78e6fe1446
# ╠═667f9060-0028-11eb-25bc-6bc6a2095f45
# ╠═3e2cd730-0028-11eb-1f80-6da40e2d4188
# ╠═1eef8e80-0028-11eb-2083-87b9ac940821
# ╠═15996b80-0028-11eb-0090-e328c7d6f30b
# ╠═ec64d740-fffa-11ea-3613-c5580a95483c
