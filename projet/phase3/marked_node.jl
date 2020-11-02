import Base.show

include("../node.jl")

mutable struct MarkedNode{T} <: AbstractNode{T}
    name::String
    data::T
    visited::Bool
    min_weight::Float64
    parent::Union{MarkedNode{T},Nothing}
end


min_weight(node::AbstractNode) = node. min_weight
parent(node::AbstractNode) = node. parent


function MarkedNode(data::T; name::String="", min_weight::Float64=Inf) where T
    MarkedNode(name, data, false, max(0.0, min_weight), nothing)
end

"""function to set the visited attribute of the Marknode """
function set_visited!(node::MarkedNode)
    node.visited = true
    node
end

"""function to set the min_weight attribute of the Marknode """
function set_min_weight!(node::MarkedNode, w::Float64)
    node.min_weight = max(0.0, w)
    node
end

"""function to set the parent attribute of the Marknode """
function set_parent!(node::MarkedNode{T}, p::MarkedNode{T}) where T
    node.parent = p
    node
end


show(node::MarkedNode) = println("node $(name(node)) at min_weight $(min_weight(node))")