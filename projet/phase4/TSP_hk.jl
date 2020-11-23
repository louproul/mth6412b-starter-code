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
        t = t/2^(period-1) 
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
    for node in Tree.nodes
        index = parse(Int, node.name)
        dᵏ[index]=length(adjacent(node))
    end
    return dᵏ
end


# function for solving TSP with Held and Karp algorithm

function HK_MST(Graph::MarkedGraph{T}, MST_Algorithm::Int64, source::MarkedNode{T}, step::Int64) where T
    iter = 0
    final_weight = 0.0
    final_TSP = nothing
    flag = 0
    n = length(Graph.nodes)
    
    # initialization of variables
    W = -Inf
    W_prev = -Inf
    wᵏ = Inf
    wᵏ⁻¹ = -Inf
    
    Πᵏ = zeros(n)
    Tᵏ = nothing          # a mimimum 1-tree
    tᵏ = 1                # step size (a positive scalar)
    Lᵏ = Inf              # total weight of Tᵏ mimimum 1-Tree
    dᵏ = zeros(n)         # vector of node degrees
    vᵏ = NaN*zeros(n)    

    period = 1            # the number of periods     
    period_dur = n/2      # number of iterations in period
    period_doubled = true 

    k = 0
    

    temp_Graph = deepcopy(Graph)        
    initial_edges = temp_Graph.edges
    initial_nodes = temp_Graph.nodes
    
    while (iter == 0) || ((vᵏ !=zeros(n)) && (iter<1000) && abs(tᵏ)>1e-13 && (period_dur != 0.0))
    
        # step(2): initializing the temporary graph and selecting the root vert
 
        Lᵏ,Tᵏ = Minimum_1Tree(temp_Graph, MST_Algorithm, source)
        
        # step 3
        wᵏ⁻¹ = wᵏ
        wᵏ = Lᵏ-2 * sum(Πᵏ)
    
        # step 4
        W_prev = W
     #   println(" W_prev: ",W, " wᵏ: ", wᵏ, " wᵏ⁻¹: ", wᵏ⁻¹)
        W = max(W,wᵏ)
     #   println("W: ",W)
        if W > W_prev
            final_TSP = Tᵏ
        end
    
        #step 5
        dᵏ = compute_deg(Tᵏ)
        vᵏ = dᵏ.-2
    
        # step 7: choosing the step size
        if (period ==1)&& (wᵏ - wᵏ⁻¹ <0.0)&&(period_doubled == true)&&(k!=0)
            period_doubled = false
        end
    
        # if last iteration leads to increment of W
        if k == Int(floor(period_dur)) && W > W_prev
            period_dur *= 2
        end
        
    
        if k > period_dur
            period_dur /= 2
            period +=1
            k = 0
        end
        
        if (period ==1) && period_doubled 
            tᵏ *= 2.0
        elseif (period !=1)
            tᵏ = Calc_step(n, k, period, period_dur, period_doubled, step)
        end

      #  println("period_doubled: ", period_doubled)
      #  println("period: ", period)
      #  println("period_dur: ", period_dur)
      #  println("tᵏ: ", tᵏ)
      #  println("k: ", k)
      #  println("_______")
    
        # step 8: updating the value of Πᵏ
        Πᵏ = Πᵏ.+ tᵏ.*vᵏ
        # update weight of edges
        temp_Graph = deepcopy(Graph)
        for edge in temp_Graph.edges
            i = parse(Int, edge.adjacentnodes[1].name)
            j = parse(Int, edge.adjacentnodes[2].name)
            edge.weight = edge.weight + Πᵏ[i]+ Πᵏ[j]
        end
    
        #step 9
        k = k +1 
        iter += 1   
    end 
    for edge in final_TSP.edges
        final_weight = final_weight + edge.weight
    end
    println("number of iteration: ", iter)
    println("period_dur: ", period_dur)
    println("tᵏ: ", tᵏ)
    if vᵏ == zeros(n)
        println("The algorithm converged successfully ")
        println("The final weight of TSP: ", Lᵏ)
    else
        println("The algorithm doesn't reach to a tour")
        println("The weight of the current 1_Tree: ", Lᵏ)
    end
    return final_weight, final_TSP
end