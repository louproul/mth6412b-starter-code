import Base.show

"""Type abstrait dont d'autres types d'arrete dériveront."""
abstract type AbstractEdge{T} end



"""Type représentant les arretes d'un graphe.

Exemple:

        edge = Edge("James", (Node1,Node2), weight)


"""
mutable struct Edge{T} <: AbstractEdge{T}
  name::String
  data::Tuple{Node{T},Node{T}}
  weight::Int
end

# on présume que tous les arretes dérivant d'AbstractEdge
# posséderont des champs `name` et `data` et 'weight'.

"""Renvoie le nom de l'arrête."""
name(edge::AbstractEdge) = edge.name

"""Renvoie les noeuds definissant l'arrête."""
data(edge::AbstractEdge) = edge.data

"""Renvoie le poids de l'arrête."""
weight(edge::AbstractEdge) = edge.weight


"""Affiche un noeud."""
function show(edge::AbstractEdge)
  println("Edge ", name(edge), ", Nodes: ", data(edge),
          ", Weight:", weight(edge))
end
