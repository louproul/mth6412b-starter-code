### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# ╔═╡ 8f58e950-01d6-11eb-3b06-11db973b964b
begin
include("../node.jl")
include("../edge.jl")
include("../graph.jl")
include("../read_stsp.jl")
end

# ╔═╡ 8aae7410-01d6-11eb-29a8-dbbfd7b97be7


# ╔═╡ 2a069b70-01d5-11eb-3b54-a1a0a9cdda52
md" Debug Phase 2"

# ╔═╡ 977098e0-01d6-11eb-344c-4d8de2d2bb0a
Ex_Graph = Graph("Graph_Ex_Notes_de_Cours", Node{Array{Float64,1}}[], Edge{Array{Float64,1}}[])

# ╔═╡ aed0ca00-01d6-11eb-147f-0701797fc391
for node_name in ["a","b","c","d","e","f","g","h","i"]
	add_node!(Ex_Graph,Node{Array{Float64,1}}(node_name,[]))
end

# ╔═╡ 924c9160-01d7-11eb-0492-1722f2616ec3
Ex_Graph

# ╔═╡ bd0b1a70-01d7-11eb-02b1-074e7301e326
begin	
	add_edge!(Ex_Graph,Edge("(a,b)",4.0,(Node{Array{Float64,1}}("a",[			]),Node{Array{Float64,1}}("b",[]))))
	add_edge!(Ex_Graph,Edge("(a,h)",8.0,(Node{Array{Float64,1}}("a",[]),Node{Array{Float64,1}}("h",[]))))
	add_edge!(Ex_Graph,Edge("(b,c)",8.0,(Node{Array{Float64,1}}("b",[]),Node{Array{Float64,1}}("c",[]))))
	add_edge!(Ex_Graph,Edge("(b,h)",11.0,(Node{Array{Float64,1}}("b",[]),Node{Array{Float64,1}}("h",[]))))
	add_edge!(Ex_Graph,Edge("(c,d)",7.0,(Node{Array{Float64,1}}("c",[]),Node{Array{Float64,1}}("d",[]))))
	add_edge!(Ex_Graph,Edge("(c,f)",4.0,(Node{Array{Float64,1}}("c",[]),Node{Array{Float64,1}}("f",[]))))
	add_edge!(Ex_Graph,Edge("(c,i)",2.0,(Node{Array{Float64,1}}("c",[]),Node{Array{Float64,1}}("i",[]))))
	add_edge!(Ex_Graph,Edge("(d,e)",9.0,(Node{Array{Float64,1}}("d",[]),Node{Array{Float64,1}}("e",[]))))
	add_edge!(Ex_Graph,Edge("(d,f)",14.0,(Node{Array{Float64,1}}("d",[]),Node{Array{Float64,1}}("f",[]))))
	add_edge!(Ex_Graph,Edge("(e,f)",10.0,(Node{Array{Float64,1}}("e",[]),Node{Array{Float64,1}}("f",[]))))
	add_edge!(Ex_Graph,Edge("(f,g)",2.0,(Node{Array{Float64,1}}("f",[]),Node{Array{Float64,1}}("g",[]))))
	add_edge!(Ex_Graph,Edge("(g,h)",1.0,(Node{Array{Float64,1}}("g",[]),Node{Array{Float64,1}}("h",[]))))
	add_edge!(Ex_Graph,Edge("(g,i)",6.0,(Node{Array{Float64,1}}("g",[]),Node{Array{Float64,1}}("i",[]))))
	add_edge!(Ex_Graph,Edge("(h,i)",7.0,(Node{Array{Float64,1}}("h",[]),Node{Array{Float64,1}}("i",[]))))
end

# ╔═╡ Cell order:
# ╠═8aae7410-01d6-11eb-29a8-dbbfd7b97be7
# ╠═2a069b70-01d5-11eb-3b54-a1a0a9cdda52
# ╠═8f58e950-01d6-11eb-3b06-11db973b964b
# ╠═977098e0-01d6-11eb-344c-4d8de2d2bb0a
# ╠═aed0ca00-01d6-11eb-147f-0701797fc391
# ╠═924c9160-01d7-11eb-0492-1722f2616ec3
# ╠═bd0b1a70-01d7-11eb-02b1-074e7301e326
