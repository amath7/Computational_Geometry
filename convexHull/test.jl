include("convexHull.jl")
using Plots

#plot vertices of convex hull in red

X = rand(20)
Y = rand(20)
pointSet = [[X[i], Y[i]] for i in 1:length(Y)]
convexHull = slowConvexHull(pointSet)
xAfter = [p[1] for p in convexHull]
yAfter = [p[2] for p in convexHull]
scatter(X, Y, label="")
scatter!(xAfter, yAfter, color="red", label="")
