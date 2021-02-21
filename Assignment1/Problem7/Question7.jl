### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 04117160-720f-11eb-226e-5174f5f0ac2f
begin
	using Plots
	pyplot()
end

# ╔═╡ f57e30b0-71fb-11eb-326f-b35fbc8ad28b
function iswin(x::Int64,y::Int64)
	if x<=y
		return -1
	else
		return 1
	end
end

# ╔═╡ d9c8d640-71fb-11eb-149d-f95be62a172f
begin
	n=100000
	th=1
	β=1
	p_val=[]
	prob=[]
	while th<=100
		num=0
		for j in 1:n
			i=1
			f=true
			money=10
			while(i<=20 && f)
				money+=iswin(rand(1:100),th)
				if money==0
					num+=1
					f=false
				end
				i+=1
			end
			
		end
		push!(prob,num/n)
		push!(p_val,0.01*th)
		th+=β
	end
end

# ╔═╡ 8e6355d0-7210-11eb-2f52-8df9d0d1c8d2
begin
	scatter(p_val,prob,markersize=10,markershape=:star5,label=false,xlabel="P values",ylabel="probability")
	plot!(p_val,prob,lw=2,title=" probability of going bankrupt at least once",label=false)
end


# ╔═╡ Cell order:
# ╠═f57e30b0-71fb-11eb-326f-b35fbc8ad28b
# ╠═d9c8d640-71fb-11eb-149d-f95be62a172f
# ╠═04117160-720f-11eb-226e-5174f5f0ac2f
# ╠═8e6355d0-7210-11eb-2f52-8df9d0d1c8d2
