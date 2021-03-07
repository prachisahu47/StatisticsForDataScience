### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 80f5c8a0-74eb-11eb-3713-5541814e2336
using DataFrames


# ╔═╡ e808ea10-7c23-11eb-0a0d-096646c72f6e
using Dates

# ╔═╡ baa8bfd0-74eb-11eb-2e1b-e74107adee7d
df3=DataFrame(
	:id=>[],
	:year=>[],
	:month=>[],
	:element=>[],
	
)

# ╔═╡ 142788e0-7be3-11eb-3679-cddfdd7af394
df4=DataFrame([Float64 for k in 1:31],[Symbol("d$k") for k in 1:31])

# ╔═╡ 2db76b3e-7be3-11eb-0f3f-9b90a4316c7c
df=hcat(df3,df4)

# ╔═╡ b858a832-7be4-11eb-1167-49408785b7ef
allowmissing!(df)

# ╔═╡ 3ac42da0-7be3-11eb-09bd-0f3690ead5fc
for i in 1:5
	num=rand(1:10)
	numAr=[rand(5:32) for i in 1:num]
	
	r1=["MX17004",2010,i,"tmax"]
	r2=["MX17004",2010,i,"tmin"]
	for k in 5:35
		push!(r1,missing)
		push!(r2,missing)
	end
	push!(df,r1)
	push!(df,r2)
	for j in 5:35
		if j in numAr
			t_max=rand(11:34)+rand()
			t_min=rand(10:t_max)+rand()
			df[2*i-1,j]=t_max
			df[2*i,j]=t_min
		end
	end
	
end

# ╔═╡ 55a80a70-7be7-11eb-30e3-67d5c74e5d2a
df

# ╔═╡ 39f30582-7be4-11eb-3241-257179a35373
modifiedDF=DataFrame(
	:id=>[],
	:date=>[],
	:tmax=>[],
	:tmin=>[]
)

# ╔═╡ d81035e0-7c24-11eb-206d-a17ead05be61
for i in 1:2:10
	for j in 1:31
		if typeof(df[i,j+4])!=Missing
			d=string("2010-0",string(Int((i+1)/2)),"-",string(j))
			push!(modifiedDF,["MX17004",d,df[i,j+4],df[i+1,j+4]])
		end
	end
end

# ╔═╡ 3a8e74d0-7c29-11eb-0469-21441072a9ca
modifiedDF.date=Date.(modifiedDF.date,"yyyy-mm-dd")

# ╔═╡ 7a2301b0-7c29-11eb-05ad-33aa6a7e9ec6
modifiedDF

# ╔═╡ Cell order:
# ╠═80f5c8a0-74eb-11eb-3713-5541814e2336
# ╠═baa8bfd0-74eb-11eb-2e1b-e74107adee7d
# ╠═142788e0-7be3-11eb-3679-cddfdd7af394
# ╠═2db76b3e-7be3-11eb-0f3f-9b90a4316c7c
# ╠═b858a832-7be4-11eb-1167-49408785b7ef
# ╠═3ac42da0-7be3-11eb-09bd-0f3690ead5fc
# ╠═55a80a70-7be7-11eb-30e3-67d5c74e5d2a
# ╠═39f30582-7be4-11eb-3241-257179a35373
# ╠═d81035e0-7c24-11eb-206d-a17ead05be61
# ╠═e808ea10-7c23-11eb-0a0d-096646c72f6e
# ╠═3a8e74d0-7c29-11eb-0469-21441072a9ca
# ╠═7a2301b0-7c29-11eb-05ad-33aa6a7e9ec6
