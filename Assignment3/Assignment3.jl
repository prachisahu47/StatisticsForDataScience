### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 7be5e870-8c71-11eb-3004-c9d7630edd93
using StatsBase

# ╔═╡ 780047a0-8c62-11eb-21c1-59ecc973fd26
using StatsPlots

# ╔═╡ b11a2ef0-8c69-11eb-1351-672730a2bce4
using QuadGK

# ╔═╡ a8eea93e-8c69-11eb-181d-3d26bd77dd08
using Distributions

# ╔═╡ 0bedf6e0-8ca1-11eb-2c98-85a6a29c3977
using Statistics

# ╔═╡ a2a6e9d0-93df-11eb-0e46-453a230c6d14
using DataFrames

# ╔═╡ 78fbf3a0-93df-11eb-3313-c1dd3c902cb6
using CSV

# ╔═╡ 39dacdf0-941f-11eb-1241-1f4ce11097bb
using Dates

# ╔═╡ f2b1c0e0-9442-11eb-2fde-e15e0cbd723b
using Plots

# ╔═╡ 6a975ce0-8ca1-11eb-2241-9deba1311a66
import NaNMath

# ╔═╡ 8149c2a0-8c71-11eb-19fb-8f25317ed4a9
md"## Q1: KL divergence"

# ╔═╡ d5b027e0-8c61-11eb-13cd-739b2cb8f93f
D(p,q)=quadgk(x->pdf(p,x)*log(pdf(p,x)/pdf(q,x)),-10,10)

# ╔═╡ 7a244d30-8c6f-11eb-0585-07c8d3fc3339
Answers=[D(TDist(i),Normal(0,1))[1] for i in 1:5]

# ╔═╡ 1720f100-8c71-11eb-2f34-cfcf20a17426
md"##### Student's T Distribution becomes Normal distribution as the value of v increases hence the KL divergence tends to zero"

# ╔═╡ 5d1539b0-8c70-11eb-10b8-57779e42bbaf
begin
	plot(Normal(0,1),-5,5,lw=3,lcolor=:red,label="Normal")
	plot!(TDist(1),-5,5,label="v=1",lw=2)
	plot!(TDist(2),-5,5,label="v=2")
	plot!(TDist(3),-5,5,label="v=3")
	plot!(TDist(4),-5,5,label="v=4")
	plot!(TDist(5),-5,5,lw=3,lcolor=:blue,label="v=5")
	plot!(TDist(10),-5,5,label="v=10")
	plot!(TDist(20),-5,5,label="v=20")
end

# ╔═╡ 7be60690-9363-11eb-06bd-97e13adaa854
md"# Q2:Convolution"

# ╔═╡ 83d96540-9363-11eb-17d3-2fc1aff77192
conv_(d,x) = sum(d[Int(floor((k+10)*1000+1))]*pdf(Normal(0,1),x-k) for k=-10:0.001:10)

# ╔═╡ c9965b30-936b-11eb-0b3b-f161aea9f53f
conv(x) = sum(pdf(Uniform(0,1),x-k)*pdf(Uniform(0,1),k) for k=-10:0.001:10)

# ╔═╡ 49ae06c0-9384-11eb-0be5-bffe194e88c3
function convolution(n)
	conv_arr=conv.(-10:.001:10)
	for i in 3:n
		arr=[conv_(conv_arr,x) for x in -10:.001:10]
		conv_arr=arr
	end
	return conv_arr
end

# ╔═╡ a123ded0-9388-11eb-2bb4-75cfeba1e485
kl=[]

# ╔═╡ 7bbe3370-9388-11eb-003d-63e685e07369
for n in 2:10
	arr=convolution(n)
	dist=fit(Normal,arr)
	push!(kl,D(dist,Normal(mean(dist),var(dist)))[1])
end

# ╔═╡ de74c1a0-93a6-11eb-33b0-a3cbd7c62c94
kl

# ╔═╡ da90a540-9388-11eb-024b-b7095f340c8a
plot(2:10,kl,label="kl values",xlabel="n")

# ╔═╡ 2f580050-93a7-11eb-27b7-07a1367f10d0
md"# Q3: synthetic dataset for right skewed data"

# ╔═╡ b2fd4d30-93c4-11eb-277d-fde538321e19
data=rand(200:250,60)

# ╔═╡ 9348b3a0-93ae-11eb-240e-010034d667b2
append!(data,rand(250:300,110))

# ╔═╡ 55f63210-93af-11eb-3e1c-2544238aeb0d
append!(data,rand(300:400,300))

# ╔═╡ 1234efa0-93a8-11eb-10ca-d1a8e7f35a93
append!(data,rand(350:400,30))

# ╔═╡ dbd94020-93af-11eb-09a1-6f912cba4603
append!(data,rand(400:500,460))

# ╔═╡ 344ee1b0-93c4-11eb-32ed-299264db004e
append!(data,rand(450:500,41))

# ╔═╡ 123d4ee0-93ba-11eb-1380-e3b28cf5b5bb
append!(data,rand(500:550,400))

# ╔═╡ 992937de-93ae-11eb-27a8-e59c70895cb0
append!(data,rand(550:600,260))		

# ╔═╡ 96385982-93ae-11eb-352d-fb2e60e6183f
append!(data,rand(600:650,120))

# ╔═╡ 7b29ac10-93be-11eb-1bd2-d176b66cf3fc
append!(data,rand(650:700,80))

# ╔═╡ 97e06430-93ae-11eb-0e00-a9d916590795
append!(data,rand(700:750,40))

# ╔═╡ a4b5cfa0-93be-11eb-3891-7572864e5e5a
append!(data,rand(750:800,30))

# ╔═╡ 51b294f0-93af-11eb-33de-414d64b321a5
append!(data,rand(800:850,25))

# ╔═╡ bca01850-93be-11eb-37df-517eacd5dafb
append!(data,rand(850:900,15))

# ╔═╡ 53e9e74e-93af-11eb-1810-25790e910239
append!(data,rand(900:1000,11))

# ╔═╡ 815f15d0-93b8-11eb-2e16-453446308a2f
append!(data,rand(1000:1100,7))

# ╔═╡ 82b57e10-93b8-11eb-21ea-df32876f95d3
append!(data,rand(1100:1200,5))

# ╔═╡ f5959aa0-93b8-11eb-3162-1b2052e5c6fa
append!(data,rand(1200:1300,3))

# ╔═╡ f7b48300-93b8-11eb-2a40-ef3c29264cee
append!(data,rand(1300:1400,2))

# ╔═╡ 3f7076e0-93b9-11eb-1794-e9bf30b22500
append!(data,rand(1400:1500,1))

# ╔═╡ 32672600-93b0-11eb-0d6f-398d25ab79e0
length(data)

# ╔═╡ 704cbfd0-93af-11eb-061a-45262a5297ff
mean(data)

# ╔═╡ 75d07e10-93af-11eb-2e34-6fc3bacce8fe
median(data)

# ╔═╡ 8a605940-9440-11eb-0d08-4bcedf171b4f
mode(data)

# ╔═╡ 84afdd90-93af-11eb-2dd0-93200d4a0146
begin
	histogram(data,bins=25,label=false)
	plot!([mean(data),mean(data)],[0,500],lw=5,label="mean")
	plot!([median(data),median(data)],[0,500],lw=2,lcolor=:black,label="median")
	plot!([mode(data),mode(data)],[0,500],lw=2,lcolor=:green,label="mode")
end

# ╔═╡ 5908976e-9389-11eb-3bb6-33755ad5d5db
md"# Q4:random samples with each sample of 30 elements from U" 

# ╔═╡ ec487152-8cb2-11eb-35e6-ab426abb8aea
ranges=[]

# ╔═╡ 9704497e-8cb2-11eb-32b1-0b281c7b220a
for i in 1:10000
	l=rand(Uniform(0,1),30)
	push!(ranges,maximum(l)-minimum(l))
end

# ╔═╡ cb8a9820-8d2b-11eb-30b3-e5f377462bbb
length(ranges)

# ╔═╡ 70eed5b0-8d2c-11eb-297f-51f80c20328c
begin
	histogram(ranges,bins=50,label=false)
	scatter!([mean(ranges)],[0],label="mean")
	scatter!([median(ranges)],[0],label="median")
	scatter!([mode(ranges)],[0],color=:black,label="mode")
end

# ╔═╡ b3ab8530-93dd-11eb-18d3-97059ba2b650
md"# Q6:CoViD data for Indian states."

# ╔═╡ 8e01ba00-93df-11eb-34e9-8d421b54a89b
df = DataFrame(CSV.File("states.csv"))

# ╔═╡ dbc4db10-942e-11eb-2682-992bbc860202
for col in names(df)
	df[!,col] = replace(df[!,col], missing => 0)
end

# ╔═╡ 48d90940-93e1-11eb-0bd2-3f2486f2dde4
df_temp=unstack(df,:Date,:State,:Confirmed)

# ╔═╡ 013acb60-9435-11eb-2d04-6722e3257175
for col in eachcol(df_temp)
    replace!(col,missing => 0)
end

# ╔═╡ 300ea450-93e2-11eb-1e16-7951a8f292c8
df_state=select(df_temp,Not(:India))

# ╔═╡ ecdbfff2-941f-11eb-0ed6-178df128998e
insertcols!(df_state,2,:week_no=>Dates.week.(df_state.Date),:year=>Dates.year.(df_state.Date))

# ╔═╡ 1df712b0-942e-11eb-1b9d-b174c0a85930
df_weeks=combine(groupby(df_state, [:week_no,:year]), names(df_state, Not([:Date,:week_no,:year])) .=> sum, renamecols=false)

# ╔═╡ 59810742-9443-11eb-2ea8-3332bf262f62
df_stats=df_weeks[!,3:39]

# ╔═╡ b67961e0-9443-11eb-3f77-7db0743dccaa
length(names(df_stats))

# ╔═╡ 2f7a5c80-9443-11eb-2542-cd9887b6997a
gr()


# ╔═╡ 3915028e-9443-11eb-0681-77050b22242d
cov_matrix=zeros(length(names(df_stats)),length(names(df_stats)))

# ╔═╡ 305abf80-9445-11eb-0c39-2b4218b62bc3
cor_matrix=zeros(length(names(df_stats)),length(names(df_stats)))

# ╔═╡ 5f43b862-9445-11eb-091e-e101dd371656
cor_matrix_spm=zeros(length(names(df_stats)),length(names(df_stats)))

# ╔═╡ a73980f0-9445-11eb-3f44-8f165922dfff
findpos(arr) = [indexin(arr[i], sort(arr))[1] for i in 1:length(arr)]

# ╔═╡ b1449c12-9445-11eb-1c65-11019a12f9f9
cor_s(x, y) = cor(findpos(x), findpos(y))

# ╔═╡ c8e01360-9443-11eb-082e-15a0f6891365
for i in 1:length(names(df_stats))
	for j in 1:length(names(df_stats))
		cov_matrix[i,j]=cov(df_stats[!,i],df_stats[!,j])
		cor_matrix[i,j]=cor(df_stats[!,i],df_stats[!,j])
		cor_matrix_spm[i,j]=cor_s(df_stats[!,i],df_stats[!,j])

	end
end

# ╔═╡ be1abe12-9445-11eb-2ce1-517cf20a795d
heatmap(cov_matrix,xlabel="state IDs",ylabel="state IDs",title="covariance")

# ╔═╡ bdf2b1c0-9447-11eb-1646-37f11dccccbf
heatmap(cor_matrix,xlabel="state IDs",ylabel="state IDs",title="Pearson’s coefficient of correlation")

# ╔═╡ c1388df0-9447-11eb-36db-276ba8da270c
heatmap(cor_matrix_spm,xlabel="state IDs",ylabel="state IDs",title="Spearman’s coefficient of correlation")

# ╔═╡ 17090562-9386-11eb-3e77-e10a65a28842
md"# Q7:OneSidedTail"

# ╔═╡ de521e42-9381-11eb-1049-a91f514907a2
function OneSidedTail_n(x)
	for t in -10:0.001:10
		if cdf(Normal(0,1),t)>=(100-x)/100
			return t
		end
	end
end

# ╔═╡ e00b2370-9382-11eb-27f1-8fa5ccf2daf0
function OneSidedTail_t(x)
	for t in -10:0.001:10
		if cdf(TDist(10),t)>=(100-x)/100
			return t
		end
	end
end

# ╔═╡ f2ff7190-9317-11eb-0061-21feab183990
begin
	plot(x->x,x->pdf(Normal(0,1),x),-10,OneSidedTail_n(95),line=(1,:green),fill=(0, :green, 0.2),label="Normal 5 %")
	plot!(x->x,x->pdf(Normal(0,1),x),-10,10,line=(2,:dash,:blue),label="Normal")
	plot!(x->x,x->pdf(TDist(10),x),-10,OneSidedTail_t(95),line=(1,:red),fill=(0, :red, 0.3),label="TDist 5 %")
	plot!(x->x,x->pdf(TDist(10),x),-10,10,line=(2,:dashdotdot,:red),label="TDist")
	plot!([0,0],[0,0.5],label="mean")
end

# ╔═╡ Cell order:
# ╠═7be5e870-8c71-11eb-3004-c9d7630edd93
# ╠═780047a0-8c62-11eb-21c1-59ecc973fd26
# ╠═b11a2ef0-8c69-11eb-1351-672730a2bce4
# ╠═a8eea93e-8c69-11eb-181d-3d26bd77dd08
# ╠═0bedf6e0-8ca1-11eb-2c98-85a6a29c3977
# ╠═6a975ce0-8ca1-11eb-2241-9deba1311a66
# ╟─8149c2a0-8c71-11eb-19fb-8f25317ed4a9
# ╠═d5b027e0-8c61-11eb-13cd-739b2cb8f93f
# ╠═7a244d30-8c6f-11eb-0585-07c8d3fc3339
# ╟─1720f100-8c71-11eb-2f34-cfcf20a17426
# ╠═5d1539b0-8c70-11eb-10b8-57779e42bbaf
# ╟─7be60690-9363-11eb-06bd-97e13adaa854
# ╠═49ae06c0-9384-11eb-0be5-bffe194e88c3
# ╠═83d96540-9363-11eb-17d3-2fc1aff77192
# ╠═c9965b30-936b-11eb-0b3b-f161aea9f53f
# ╠═a123ded0-9388-11eb-2bb4-75cfeba1e485
# ╠═7bbe3370-9388-11eb-003d-63e685e07369
# ╠═de74c1a0-93a6-11eb-33b0-a3cbd7c62c94
# ╠═da90a540-9388-11eb-024b-b7095f340c8a
# ╟─2f580050-93a7-11eb-27b7-07a1367f10d0
# ╠═b2fd4d30-93c4-11eb-277d-fde538321e19
# ╠═9348b3a0-93ae-11eb-240e-010034d667b2
# ╠═55f63210-93af-11eb-3e1c-2544238aeb0d
# ╠═1234efa0-93a8-11eb-10ca-d1a8e7f35a93
# ╠═dbd94020-93af-11eb-09a1-6f912cba4603
# ╠═344ee1b0-93c4-11eb-32ed-299264db004e
# ╠═123d4ee0-93ba-11eb-1380-e3b28cf5b5bb
# ╠═992937de-93ae-11eb-27a8-e59c70895cb0
# ╠═96385982-93ae-11eb-352d-fb2e60e6183f
# ╠═7b29ac10-93be-11eb-1bd2-d176b66cf3fc
# ╠═97e06430-93ae-11eb-0e00-a9d916590795
# ╠═a4b5cfa0-93be-11eb-3891-7572864e5e5a
# ╠═51b294f0-93af-11eb-33de-414d64b321a5
# ╠═bca01850-93be-11eb-37df-517eacd5dafb
# ╠═53e9e74e-93af-11eb-1810-25790e910239
# ╠═815f15d0-93b8-11eb-2e16-453446308a2f
# ╠═82b57e10-93b8-11eb-21ea-df32876f95d3
# ╠═f5959aa0-93b8-11eb-3162-1b2052e5c6fa
# ╠═f7b48300-93b8-11eb-2a40-ef3c29264cee
# ╠═3f7076e0-93b9-11eb-1794-e9bf30b22500
# ╠═32672600-93b0-11eb-0d6f-398d25ab79e0
# ╠═704cbfd0-93af-11eb-061a-45262a5297ff
# ╠═75d07e10-93af-11eb-2e34-6fc3bacce8fe
# ╠═8a605940-9440-11eb-0d08-4bcedf171b4f
# ╠═84afdd90-93af-11eb-2dd0-93200d4a0146
# ╟─5908976e-9389-11eb-3bb6-33755ad5d5db
# ╠═ec487152-8cb2-11eb-35e6-ab426abb8aea
# ╠═9704497e-8cb2-11eb-32b1-0b281c7b220a
# ╠═cb8a9820-8d2b-11eb-30b3-e5f377462bbb
# ╠═70eed5b0-8d2c-11eb-297f-51f80c20328c
# ╟─b3ab8530-93dd-11eb-18d3-97059ba2b650
# ╠═a2a6e9d0-93df-11eb-0e46-453a230c6d14
# ╠═78fbf3a0-93df-11eb-3313-c1dd3c902cb6
# ╠═8e01ba00-93df-11eb-34e9-8d421b54a89b
# ╠═dbc4db10-942e-11eb-2682-992bbc860202
# ╠═48d90940-93e1-11eb-0bd2-3f2486f2dde4
# ╠═013acb60-9435-11eb-2d04-6722e3257175
# ╠═300ea450-93e2-11eb-1e16-7951a8f292c8
# ╠═39dacdf0-941f-11eb-1241-1f4ce11097bb
# ╠═ecdbfff2-941f-11eb-0ed6-178df128998e
# ╠═1df712b0-942e-11eb-1b9d-b174c0a85930
# ╠═59810742-9443-11eb-2ea8-3332bf262f62
# ╠═b67961e0-9443-11eb-3f77-7db0743dccaa
# ╠═f2b1c0e0-9442-11eb-2fde-e15e0cbd723b
# ╠═2f7a5c80-9443-11eb-2542-cd9887b6997a
# ╠═3915028e-9443-11eb-0681-77050b22242d
# ╠═305abf80-9445-11eb-0c39-2b4218b62bc3
# ╠═5f43b862-9445-11eb-091e-e101dd371656
# ╠═a73980f0-9445-11eb-3f44-8f165922dfff
# ╠═b1449c12-9445-11eb-1c65-11019a12f9f9
# ╠═c8e01360-9443-11eb-082e-15a0f6891365
# ╠═be1abe12-9445-11eb-2ce1-517cf20a795d
# ╠═bdf2b1c0-9447-11eb-1646-37f11dccccbf
# ╠═c1388df0-9447-11eb-36db-276ba8da270c
# ╟─17090562-9386-11eb-3e77-e10a65a28842
# ╠═de521e42-9381-11eb-1049-a91f514907a2
# ╠═e00b2370-9382-11eb-27f1-8fa5ccf2daf0
# ╠═f2ff7190-9317-11eb-0061-21feab183990
