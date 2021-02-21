### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 4f5b6fc0-7027-11eb-14f8-0f612138310f
begin
	using Plots
	pyplot()
end

# ╔═╡ 3509f8b0-71b4-11eb-1dfc-d15e3b817be8
using Distributions

# ╔═╡ 287b9d2e-71f8-11eb-1a10-0b5cf2ce7cf5
using LinearAlgebra

# ╔═╡ 9722c230-700f-11eb-2804-af2ebe7ee9f5
md"### Creating a deck with jack,queen and king as 11,12 and 13 respectively"

# ╔═╡ ac6a21e0-6fc1-11eb-3657-e98ace1659a9
deck=[i for j in 1:4 for i in 1:13]

# ╔═╡ aecef770-6fc2-11eb-2379-8d556944f501
md"# _1.With replacement_"

# ╔═╡ 8f1d1400-700f-11eb-37a9-3f3eab71cb07
begin
	N=1000000
	total=zeros(6)
	for i in 1:N
		sel=[]
		sel=[rand(deck) for j in 1:5]
		total[count(sel.==[(11)])+1]+=1
	end
	
end

# ╔═╡ 310d4730-7015-11eb-255a-a5d2b76f64e6
total

# ╔═╡ d6e55530-7015-11eb-045b-71616e0851ce
begin
    prob=total/N
end

# ╔═╡ 2c40e250-7026-11eb-08f5-69d5c233d642
begin
	scatter([0:5],prob,label="probability with replacement")
	plot!([0:5],prob,xlabel="no. of jacks",label=false)
	
end

# ╔═╡ c8c25820-7026-11eb-3e7c-d1513e0c0b68
md"# _2.Without replacement_"

# ╔═╡ a50fc840-7058-11eb-341a-8f1156193844
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
	
end

# ╔═╡ 5ca368c0-705b-11eb-126a-fbeef234e024
prob_=total_/n


# ╔═╡ 7a446690-705b-11eb-1566-3158adda4c42
begin
	scatter([0:4],prob_,label="probability without replacement")
	plot!([0:4],prob_,xlabel="no. of jacks",label=false)
	
end

# ╔═╡ a97d8ce2-71bc-11eb-03af-ef29c93f771a


# ╔═╡ e1fefe60-71bb-11eb-0252-47a82dcd738a
y=1

# ╔═╡ 41899640-71b4-11eb-29fe-3b8fb9f7d5c8
distBinom=[(binomial(5,i)*(0.077)^i*(0.923)^(5-i)) for i in 0:5]

# ╔═╡ afa3d670-71ed-11eb-1c6d-f11c73963b3b
distHyGeo=[(binomial(4,i)*binomial(48,5-i))/binomial(52,5) for i in 0:4]

# ╔═╡ 76de0d40-705f-11eb-383e-ef93a5c3271b
md"## _plotting together_"

# ╔═╡ 08b696c0-705f-11eb-1efb-4d71bbc2bb4c
begin
	scatter([0:4],prob_,label=false,ylabel="probability")
	scatter!([0:5],prob,label=false)
	plot!([0:4],prob_,xlabel="Number of jacks",label="without replacement",lcolor=:red)
	plot!([0:5],prob,label="with replacement",lcolor=:blue)
end

# ╔═╡ 545b86b0-71f6-11eb-0d96-690550e2160c
error1=distBinom-prob

# ╔═╡ 593999a0-71f7-11eb-2a0c-551c65c5d879
meanSqErr1=dot(error1,error1)/6

# ╔═╡ b44a3df0-71f6-11eb-0448-adf25f408c60
error2=distHyGeo-prob_

# ╔═╡ 32118850-71f8-11eb-1b88-e36e60600330
meanSqErr2=dot(error2,error2)/5

# ╔═╡ c2518cf0-71f6-11eb-38e2-3bb63ec2b285
begin
	plot([0:5],error1,label="error in with replacement",markershape=:star5,xlabel="Number of jacks(n)")
	plot!([0:4],error2,label="error in without replacement",markershape=:diamond,title="Difference in theoretical and experimental results")
end

# ╔═╡ Cell order:
# ╟─9722c230-700f-11eb-2804-af2ebe7ee9f5
# ╠═ac6a21e0-6fc1-11eb-3657-e98ace1659a9
# ╟─aecef770-6fc2-11eb-2379-8d556944f501
# ╠═8f1d1400-700f-11eb-37a9-3f3eab71cb07
# ╠═310d4730-7015-11eb-255a-a5d2b76f64e6
# ╠═d6e55530-7015-11eb-045b-71616e0851ce
# ╠═4f5b6fc0-7027-11eb-14f8-0f612138310f
# ╠═2c40e250-7026-11eb-08f5-69d5c233d642
# ╟─c8c25820-7026-11eb-3e7c-d1513e0c0b68
# ╠═a50fc840-7058-11eb-341a-8f1156193844
# ╠═5ca368c0-705b-11eb-126a-fbeef234e024
# ╠═7a446690-705b-11eb-1566-3158adda4c42
# ╠═3509f8b0-71b4-11eb-1dfc-d15e3b817be8
# ╠═a97d8ce2-71bc-11eb-03af-ef29c93f771a
# ╠═e1fefe60-71bb-11eb-0252-47a82dcd738a
# ╠═41899640-71b4-11eb-29fe-3b8fb9f7d5c8
# ╠═afa3d670-71ed-11eb-1c6d-f11c73963b3b
# ╟─76de0d40-705f-11eb-383e-ef93a5c3271b
# ╠═08b696c0-705f-11eb-1efb-4d71bbc2bb4c
# ╠═287b9d2e-71f8-11eb-1a10-0b5cf2ce7cf5
# ╠═545b86b0-71f6-11eb-0d96-690550e2160c
# ╠═593999a0-71f7-11eb-2a0c-551c65c5d879
# ╠═32118850-71f8-11eb-1b88-e36e60600330
# ╠═b44a3df0-71f6-11eb-0448-adf25f408c60
# ╠═c2518cf0-71f6-11eb-38e2-3bb63ec2b285
