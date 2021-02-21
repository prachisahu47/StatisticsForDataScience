### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ cf46d4b0-7430-11eb-3b14-bf3dc6cb7cc2
using LinearAlgebra

# ╔═╡ ecf5b530-7430-11eb-3731-5fa269a1f002
begin
	using Plots
	pyplot()
end

# ╔═╡ bd2a4100-742f-11eb-1eb5-616bacac6990
deck=[i for j in 1:4 for i in 1:13]

# ╔═╡ 62ff8fe0-7430-11eb-0ab2-c703ada1d5b9


# ╔═╡ 6217ef00-7430-11eb-311a-f18be6012a49
begin
	N=1000000
	total=zeros(6)
	for i in 1:N
		sel=[]
		sel=[rand(deck) for j in 1:5]
		total[count(sel.==[(11)])+1]+=1
	end
	prob=total/N
end

# ╔═╡ 84db9f52-7430-11eb-301a-57bfd0648473
begin
	n=1000000
	total_=zeros(5) #no. of jacks possible are 0,1,2,3 and 4
	for i in 1:n
		sel_=0
		decknew=copy(deck);
		for j in 1:5
			x=rand(decknew)
			if x==11
				sel_+=1
			end
			deleteat!(decknew,findfirst(y-> y ==x,decknew))
		end
		total_[sel_+1]+=1
	end
	prob_=total_/n
end

# ╔═╡ 97c2f280-7430-11eb-3ba7-5be9b3c8085e
distBinom=[(binomial(5,i)*(0.077)^i*(0.923)^(5-i)) for i in 0:5]

# ╔═╡ a1addb70-7430-11eb-2245-932d370290e2
distHyGeo=[(binomial(4,i)*binomial(48,5-i))/binomial(52,5) for i in 0:4]

# ╔═╡ aea36c50-7430-11eb-204e-9dad681a031c
error1=distBinom-prob

# ╔═╡ b3808a50-7430-11eb-1dde-a7f543b85168
error2=distHyGeo-prob_

# ╔═╡ beefc950-7430-11eb-0362-b7e2285731ae
meanSqErr1=dot(error1,error1)/6

# ╔═╡ cb5ec510-7430-11eb-1b70-6dc0959b0cab
meanSqErr2=dot(error2,error2)/5

# ╔═╡ e967fa90-7430-11eb-32de-cf44b93307a6
begin
	plot([0:5],error1,label="error in with replacement",markershape=:star5,xlabel="Number of jacks(n)")
	plot!([0:4],error2,label="error in without replacement",markershape=:diamond,title="Difference in theoretical and experimental results")
end

# ╔═╡ Cell order:
# ╠═bd2a4100-742f-11eb-1eb5-616bacac6990
# ╠═62ff8fe0-7430-11eb-0ab2-c703ada1d5b9
# ╠═6217ef00-7430-11eb-311a-f18be6012a49
# ╠═84db9f52-7430-11eb-301a-57bfd0648473
# ╠═97c2f280-7430-11eb-3ba7-5be9b3c8085e
# ╠═a1addb70-7430-11eb-2245-932d370290e2
# ╠═aea36c50-7430-11eb-204e-9dad681a031c
# ╠═b3808a50-7430-11eb-1dde-a7f543b85168
# ╠═cf46d4b0-7430-11eb-3b14-bf3dc6cb7cc2
# ╠═beefc950-7430-11eb-0362-b7e2285731ae
# ╠═cb5ec510-7430-11eb-1b70-6dc0959b0cab
# ╠═ecf5b530-7430-11eb-3731-5fa269a1f002
# ╠═e967fa90-7430-11eb-32de-cf44b93307a6
