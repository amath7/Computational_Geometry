doc"""
```isPointToLeft(p::Vector, q::Vector, r::Vector)```

Returns boolean answering if point $\vec{r}$ is to the left side
of the directed line from $\vec{p}$ to $\vec{q}$ in a 2D plane
"""
function isPointToLeft(p, q, r, ϵ=1e-3)
    PQ_PR = zeros(2,2)

    #matrix formed by column vectors PQ, PR
    PQ_PR[:, 1] = (p - q)
    PQ_PR[:, 2] = (p - r)

    (det(PQ_PR) <= ϵ) ? false : true # equality is colinearity with p and q
end

doc"""
```slowConvexHull(pointSet)```

Compute Convex hull of the ```pointSet``` and return the vertices
"""
function slowConvexHull(pointSet)
    E = []
    for p in pointSet, q in pointSet
        if (p != q)
            valid = true
            for r in pointSet
                if (r != p) & (r != q)
                    isPointToLeft(p, q, r) ? valid = false : nothing
                end
            end
            valid ? push!(E, p) : nothing
        end
    end
    return E
end
