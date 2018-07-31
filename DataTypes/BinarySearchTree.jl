struct Null end

mutable struct TreeNode{T}
    key::T
    par::TreeNode
    left::Union{TreeNode, Null}
    right::Union{TreeNode, Null}
end

mutable struct BST
    root::Union{TreeNode, Null}
    size::Int
end

function Base.length(x::BST)
    x.size
end

function inorder_tree_walk(x)
    if !isa(x, Null)
        inorder_tree_walk(x.left)
        print(x.key)
        inorder_tree_walk(x.right)
    end
end
