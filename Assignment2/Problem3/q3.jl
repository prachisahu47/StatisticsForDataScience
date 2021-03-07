### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 2ea6a540-7277-11eb-0cee-db7471120046
using DataFrames

# ╔═╡ 58e120e0-7ca1-11eb-38ca-97e3d6051cc4
using Dates

# ╔═╡ e5b71460-7c2f-11eb-1191-1def66fcbe1b
df=DataFrame(
	:year=>[],
	:artist=>[],
	:time=>[],
	:track=>[],
	:date=>Date[],
	:week=>[],
	:rank=>[]
)

# ╔═╡ 46ec7c70-7c30-11eb-3035-af7efeb729b6
begin
	push!(df,[2000 ,"2 Pac", "4:22", "Baby Don’t Cry", Date("2000-02-26") ,1 ,87])
	push!(df,[2000 ,"2 Pac", "4:22" ,"Baby Don’t Cry", Date("2000-03-04") ,2 ,82])
	push!(df,[2000 ,"2 Pac", "4:22", "Baby Don’t Cry", Date("2000-03-11"), 3, 72])
	push!(df,[2000 ,"2 Pac", "4:22" ,"Baby Don’t Cry" ,Date("2000-03-18") ,4, 77])
	push!(df,[2000 ,"2 Pac", "4:22" ,"Baby Don’t Cry" , Date("2000-03-25"), 5, 87
])
	push!(df,[2000 ,"2 Pac", "4:22" ,"Baby Don’t Cry" , Date("2000-04-01") ,6 ,94
])
	push!(df,[2000 ,"2 Pac", "4:22" ,"Baby Don’t Cry" , Date("2000-04-08"), 7, 99
])
	push!(df,[2000, "2Ge+her", "3:15", "The Hardest Part Of ...", Date("2000-09-02"), 1, 91])
	push!(df,[2000, "2Ge+her", "3:15", "The Hardest Part Of ...", Date("2000-09-09"), 2, 87
])
	push!(df,[2000, "2Ge+her", "3:15", "The Hardest Part Of ...", Date("2000-09-16"), 3, 92
])
	push!(df,[2000, "3 Doors Down", "3:53", "Kryptonite", Date("2000-04-08") ,1, 81
])
	push!(df,[2000, "3 Doors Down", "3:53", "Kryptonite", Date("2000-04-15") ,2 ,70
])
	push!(df,[2000, "3 Doors Down", "3:53", "Kryptonite", Date("2000-04-22") ,3 ,68
])
	push!(df,[2000, "3 Doors Down", "3:53", "Kryptonite", Date("2000-04-29") ,4 ,67
])
	push!(df,[2000, "3 Doors Down", "3:53", "Kryptonite", Date("2000-05-06" ),5, 66
])
end

# ╔═╡ e5d1445e-7c35-11eb-3ec4-b930a81cb79b
insertcols!(df,1,:isnotunique=>nonunique(df,4))

# ╔═╡ ab46cbc0-7c9f-11eb-1d46-bf9afae8ae86
df3=DataFrame(
	:id=>[],
	:artist=>[],
	:track=>[],
	:time=>[]
)

# ╔═╡ bf054510-7c9f-11eb-36a6-c1104070e9e8
df4=DataFrame(
	:id=>[],
	:date=>Date[],
	:rank=>[]
)

# ╔═╡ cb9388a0-7c9f-11eb-2eda-253799de1271
begin
	id_no1=1
	for i in 1:15
		if !(df[i,:isnotunique])
			push!(df3,[id_no1,df[i,:artist],df[i,:track],df[i,:time]])
			push!(df4,[id_no1,df[i,:date],df[i,:rank]])
			id_no1+=1
		else
			push!(df4,[ df3[findfirst(x->x==df[i,:track],df3.track),:id] ,df[i,:date],df[i,:rank]])
		end
		
	end
end

# ╔═╡ f13ed310-7ca0-11eb-0b86-9dcbf4de5cdc
df3

# ╔═╡ f480deb0-7ca0-11eb-11e9-f76f4626a9c6
df4

# ╔═╡ f6acbf60-7ca0-11eb-1ac1-e5a0509ea0eb


# ╔═╡ Cell order:
# ╠═2ea6a540-7277-11eb-0cee-db7471120046
# ╠═58e120e0-7ca1-11eb-38ca-97e3d6051cc4
# ╠═e5b71460-7c2f-11eb-1191-1def66fcbe1b
# ╠═46ec7c70-7c30-11eb-3035-af7efeb729b6
# ╠═e5d1445e-7c35-11eb-3ec4-b930a81cb79b
# ╠═ab46cbc0-7c9f-11eb-1d46-bf9afae8ae86
# ╠═bf054510-7c9f-11eb-36a6-c1104070e9e8
# ╠═cb9388a0-7c9f-11eb-2eda-253799de1271
# ╠═f13ed310-7ca0-11eb-0b86-9dcbf4de5cdc
# ╠═f480deb0-7ca0-11eb-11e9-f76f4626a9c6
# ╠═f6acbf60-7ca0-11eb-1ac1-e5a0509ea0eb
