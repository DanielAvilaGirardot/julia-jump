using JuMP, Gurobi

m = Model(solver = GurobiSolver(Presolve=0, LogToConsole=0, LogFile="log/test-gurobi.log"))
##
@variable(m, 0 <= x <= 2)
@variable(m, 0 <= y <= 30)

@objective(m, Max, 5x + 3y)
@constraint(m, 1x + 5y <= 3.0)

print(m)
##
status = solve(m)

println("Objective value: ", getobjectivevalue(m))
println("x = ", getvalue(x))
println("y = ", getvalue(y))
