### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ d8a53bb0-7128-11eb-3c44-09d36c3f85ea
begin
	using Plots
	pyplot()
end

# ╔═╡ 6ce7a7c0-7432-11eb-2ce9-c1d275629c4b
md"# _Using binomial distribution_"

# ╔═╡ a926dd70-7124-11eb-22d2-758fff9d2611
begin
	p=0.01
	α=0.01
	totalprob=[]
	pvalues=[]
	while p<=1
		prob=0
		q=1-p
		prob=sum([binomial(20,i)*q^i*p^(20-i) for i in 10:20])
		push!(totalprob,prob)
		push!(pvalues,p)
		p=p+α
		
	end
end

# ╔═╡ df2c2e90-7127-11eb-1e52-735bd740906a
totalprob

# ╔═╡ a8fae410-7127-11eb-0043-7317ed629d02
pvalues

# ╔═╡ 55779b20-71a0-11eb-29ce-db5ba7fba4b2
scatter(pvalues,totalprob,title="prabability of money left>=10",xlabel="P values",label=false)

# ╔═╡ 90ea67c0-7432-11eb-2dde-ab3278ff2b7a
md"# _Experimentally_"

# ╔═╡ 8a712560-7152-11eb-011c-95b69f438451
function iswin(x::Int64,y::Float64)
	return x>y
end

# ╔═╡ 9a77e350-7151-11eb-0f5f-1533050a5385
begin
	th=1.0
	β=1.0
	prbplot=[]
	p_values=[]
	while th<=100
		push!(p_values,0.01*th)
		tot=[sum([iswin(rand(1:100),th) for i in 1:20]) for j in 1:100000]
		prbly=count(tot.>=10)/100000
		th=th+β
		push!(prbplot,prbly)
	end
end

# ╔═╡ cbeef9c0-7154-11eb-3ee7-77f5ff59dc21
prbplot

# ╔═╡ 2b9fa120-7156-11eb-2880-83c69d69e0bd
p_values

# ╔═╡ de58f510-71a0-11eb-189c-454027ac0dc7
scatter(p_values,prbplot,title="prabability of money left>=10",xlabel="P values")

# ╔═╡ ce8a3710-71a1-11eb-0c86-f15d72edc6d7
begin
	scatter(pvalues,totalprob,title="prabability of money left>=Rs.10",xlabel="P values",label="theoritical prababilities",marker = (:hexagon, 12, 0.6, :blue))
	scatter!(p_values,prbplot,label="experimentally computed probabilities",markersize=6,markercolor=:red,markershape=:cross,ylabel="probability")
end

# ╔═╡ Cell order:
# ╟─6ce7a7c0-7432-11eb-2ce9-c1d275629c4b
# ╠═a926dd70-7124-11eb-22d2-758fff9d2611
# ╠═df2c2e90-7127-11eb-1e52-735bd740906a
# ╠═a8fae410-7127-11eb-0043-7317ed629d02
# ╠═d8a53bb0-7128-11eb-3c44-09d36c3f85ea
# ╠═55779b20-71a0-11eb-29ce-db5ba7fba4b2
# ╟─90ea67c0-7432-11eb-2dde-ab3278ff2b7a
# ╠═8a712560-7152-11eb-011c-95b69f438451
# ╠═9a77e350-7151-11eb-0f5f-1533050a5385
# ╠═cbeef9c0-7154-11eb-3ee7-77f5ff59dc21
# ╠═2b9fa120-7156-11eb-2880-83c69d69e0bd
# ╠═de58f510-71a0-11eb-189c-454027ac0dc7
# ╠═ce8a3710-71a1-11eb-0c86-f15d72edc6d7
