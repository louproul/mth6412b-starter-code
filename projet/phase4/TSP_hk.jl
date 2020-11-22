using InteractiveUtils

include("../phase3/marked_node.jl")
include("../phase3/marked_edge.jl")
include("../phase3/marked_graph.jl")
include("../phase3/Prime_Alg.jl")
include("../phase3/kruskal_Alg.jl")

include("one_tree.jl")

# function to calculate step size
function Calc_step(n::Int64, k::Int64, period::Int64, period_dur::Float64, period_doubled::Bool, method::Int64)
    t = 1.0
    if method ==1
        if period > 1
            t = t/2^(period-1)
        end
    
        if period_doubled 
            t *= 2.0
        end
    end
    
    if method == 2
        k = max(1.0,k)
        t = t/k
    end
    
    if method ==3
        k = max(1.0,k)
        t = t/sqrt(k)
    end 
    
    return t
end



# function to calculate degree of nodes in a graph/tree
function compute_deg(Tree::MarkedGraph{T}) where T
    n = length(Tree.nodes)
    dᵏ = zeros(n)
    for i in 1:n
        dᵏ[i]=length(adjacent(Tree.nodes[i]))
    end
    return dᵏ
end


# function for solving TSP with Held and Karp algorithm

function HK_MST(Graph::MarkedGraph{T}, MST_Algorithm::Int64, source::MarkedNode{T}, step::Int64) where T
    
    n = length(Main_Graph.nodes)
    
    # initialization of variables
    W = -Inf
    W_prev = -Inf
    wᵏ = Inf
    wᵏ⁻¹ = Inf
    
    Πᵏ = zeros(n)
    Tᵏ = nothing          # a mimimum 1-tree
    tᵏ = 1                # step size (a positive scalar)
    Lᵏ = Inf              # total weight of Tᵏ mimimum 1-Tree
    dᵏ = zeros(n)         # vector of node degrees
    vᵏ = NaN*zeros(n)    

    period = 1            # the number of periods     
    period_dur = n/2      # number of iterations in period
    period_doubled = false 

    k = 0
    
    
    
    temp_Graph = deepcopy(Main_Graph)
    while (k == 0) || (vᵏ !=zeros(n)) && (k<50000) && norm(tᵏ)>1e-020 && (period_dur != 0) 
    
        # step(2): initializing the temporary graph and selecting the root vert
 
        Lᵏ,Tᵏ = Minimum_1Tree(temp_Graph, MST_Algorithm , source)
    
        # step 3
        wᵏ⁻¹ = wᵏ
        wᵏ = Lᵏ-2 * sum(Πᵏ)
    
        # step 4
        W_prev = W
        W = max(W,wᵏ)
    
        #step 5
        dᵏ = compute_deg(Tᵏ)
        vᵏ = dᵏ.-2
    
        # step 7: choosing the step size
        (period ==1) && (period_doubled =(wᵏ> wᵏ⁻¹))
    
        # if last iteration leads to increment of W
        if k == Int(floor(period_dur)) && W > W_prev
            period_dur *= 2
        end
    
        if k > period_dur
            period_dur /= 2
            period +=1
        end

        tᵏ = Calc_step(n, k, period, period_dur, period_doubled, step)
    
        # step 8: updating the value of Πᵏ
        Πᵏ = Πᵏ.+ tᵏ.*vᵏ
        # update weight of edges
        # temp_Graph = deepcopy(Main_Graph)
        for edge in temp_Graph.edges
            i = parse(Int, edge.adjacentnodes[1].name)
            j = parse(Int, edge.adjacentnodes[2].name)
            edge.weight = edge.weight + Πᵏ[i]+ Πᵏ[j]
        end
    
        #step 9
        k = k +1    
    end 
    if vᵏ == zeros(n)
        println("The algorithm converged successfully ")
        println("The final weight of TSP: ", Lᵏ)
    else
        println("The algorithm doesn't reach to a tour")
        println("The weight of the current 1_Tree: ", Lᵏ)
    end
    return Lᵏ, Tᵏ    
end