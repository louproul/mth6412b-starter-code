import Base.show
include("node.jl")
include("edge.jl")

"""Type abstrait dont d'autres types de graphes dériveront."""
abstract type AbstractDisjointSet{T} end

"""Type representant un graphe comme un ensemble de noeuds.

Exemple :

    node1 = Node("Joe", 3.14)
    node2 = Node("Steve", exp(1))
    node3 = Node("Jill", 4.12)
    G = Graph("Ick", [node1, node2, node3])

Attention, tous les noeuds doivent avoir des données de même type.
"""
mutable struct DisjointSet{T} <: AbstractDisjointSet{T}
  dict_sets::Dict{String, Tuple{String, Set{Node{T}}, Set{Edge{T}}}}
end
                                                                                                                                                                                                                                                                                                                                              

"""Creation of disjoint sets from a graph"""
DisjointSet{T}() where T = DisjointSet(Dict{String,Tuple{String, Set{Node{T}}, Set{Edge{T}}}}())


"""Returns the edges"""
edges(disjointset::DisjointSet{T}) where T = collect(values(disjointset.dict_sets))[1][3]

"""Returns the nodes"""
nodes(disjointset::DisjointSet{T}) where T = collect(values(disjointset.dict_sets))[1][2]

"""Creation of disjoint sets from a graph"""
function create_disjointSet!(disjointset::DisjointSet{T}, graph::Graph{T}) where T 
  #T = valtype(graph.edges)
  for node in graph.nodes
    disjointset.dict_sets[node.name] = (node.name, Set([node]), Set(Edge{T}[])) 
  end
end

function find_root(disjointset::DisjointSet{T},node::Node{T}) where T
  disjointset.dict_sets[node.name][1]
end

function is_arc_disjoint(disjointset::DisjointSet{T},edge::Edge{T}) where T
  return(find_root(disjointset,edge.adjacentnodes[1]) != find_root(disjointset,edge.adjacentnodes[2]))
end

function union_disjoint_set(disjointset::DisjointSet{T}, new_edge::Edge{T} ) where T
  node_name=new_edge.adjacentnodes[1].name
  node_name2=new_edge.adjacentnodes[2].name
  New_Set = union(disjointset.dict_sets[node_name][2],
  disjointset.dict_sets[node_name2][2])
  New_Set_Edges = union(disjointset.dict_sets[node_name][3],
  disjointset.dict_sets[node_name2][3])
  New_Set_Edges = union(New_Set_Edges, Set([new_edge]))
  New_Set_Name = disjointset.dict_sets[node_name][1]
  
  for element in New_Set
    disjointset.dict_sets[element.name]=  (New_Set_Name, New_Set, New_Set_Edges)
  end
end