### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ dec0a480-7335-11eb-1002-6970ee5a5c23
begin
	using Plots

	pyplot()
end

# ╔═╡ e8236390-72e6-11eb-2604-db894b309fc7
begin
letters=[i for i in 1:78]
password=[42,18,1,3,8,9,65,54]
wordcount=zeros(7)
n::BigInt=1000000
num=0
for i in 1:n
	trial=[rand(letters) for j in 1:8]
	t=count(password-trial.==[(0)])
	i=2
	while i<=t
		wordcount[i-1]+=1
		i+=1
	end
end
end

# ╔═╡ eb7c60b0-7335-11eb-0e00-2fe64b2f407b
plot(2:8,wordcount/n,lw=2,xlabel="no. of characters",ylabel="probability",title="probability of at least x character match",label=false)

# ╔═╡ Cell order:
# ╠═e8236390-72e6-11eb-2604-db894b309fc7
# ╠═dec0a480-7335-11eb-1002-6970ee5a5c23
# ╠═eb7c60b0-7335-11eb-0e00-2fe64b2f407b
