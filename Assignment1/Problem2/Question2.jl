### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 4f5b6fc0-7027-11eb-14f8-0f612138310f
begin
	using Plots
	pyplot()
end

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

# ╔═╡ 76de0d40-705f-11eb-383e-ef93a5c3271b
md"## _plotting together_"

# ╔═╡ 08b696c0-705f-11eb-1efb-4d71bbc2bb4c
begin
	scatter([0:4],prob_,label=false,ylabel="probability")
	scatter!([0:5],prob,label=false)
	plot!([0:4],prob_,xlabel="Number of jacks",label="without replacement",lcolor=:red)
	plot!([0:5],prob,label="with replacement",lcolor=:blue)
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
# ╟─76de0d40-705f-11eb-383e-ef93a5c3271b
# ╠═08b696c0-705f-11eb-1efb-4d71bbc2bb4c
