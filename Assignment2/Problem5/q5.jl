### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 9099e9a0-74e9-11eb-103b-41157754968e
using DataFrames

# ╔═╡ c5e39340-74e9-11eb-2664-73177a2e5b7f
using HTTP

# ╔═╡ 1a1a4170-7ce7-11eb-280f-8b8a2bf10294
using JSON

# ╔═╡ 005550a0-7d7c-11eb-00b5-13d2b3220ada
begin
	using Plots
	pyplot()
end

# ╔═╡ 51f01ec0-7ce8-11eb-0e4b-17cd688ea6c5
r_link="https://api.covid19india.org/data.json"

# ╔═╡ 6109ef30-7ce8-11eb-3dd8-5da2870127fb
response=HTTP.get(r_link)

# ╔═╡ 814c72e0-7ce8-11eb-3949-b9b31c1fb0d0
str=String(response.body)

# ╔═╡ 8c575910-7d5c-11eb-3549-5d7694d0af8f
data=JSON.Parser.parse(str)

# ╔═╡ e73bee50-7ced-11eb-025d-b58dc8da330f
cases_time_series=vcat(DataFrame.(data["cases_time_series"])...)

# ╔═╡ cf177410-7cf3-11eb-306a-ad3a58e98697
cases_time_series.dailyconfirmed = passmissing(parse).(Int, cases_time_series.dailyconfirmed)

# ╔═╡ c5f8bf50-7cf4-11eb-21dd-7bd4beaa699e
cases_time_series.dailydeceased = passmissing(parse).(Int, cases_time_series.dailydeceased)

# ╔═╡ d1ec4980-7cf4-11eb-022a-abd0d96056f6
cases_time_series.dailyrecovered = passmissing(parse).(Int, cases_time_series.dailyrecovered)

# ╔═╡ 6ba71c70-7d7d-11eb-3a53-038074757fd0
begin
	dconfirmed=[ sum([cases_time_series.dailyconfirmed[i-j] for j in 0:6])/7 for i in 	7:400]
	for i in 1:6
		pushfirst!(dconfirmed,0) 
	end

	plot(1:400,cases_time_series.dailyconfirmed,label="Original Values",title="Confirmed cases VS Time",lcolor="blue")
	plot!(1:400,dconfirmed,lw=2,lcolor="red",label="smoothened Values",ylabel="Number of cases",xlabel="Each day from 30jan,2020 to 3march,2021")
end

# ╔═╡ 0d3c298e-7d7e-11eb-237a-1196960959d3
begin
	ddeceased=[ sum([cases_time_series.dailydeceased[i-j] for j in 0:6])/7 for i in 	7:400]
	for i in 1:6
		pushfirst!(ddeceased,0) 
	end

	plot(1:400,cases_time_series.dailydeceased,label="Original Values",title="Deceased cases VS Time",lcolor="blue")
	plot!(1:400,ddeceased,lw=2,lcolor="red",label="smoothened Values",ylabel="Number of cases",xlabel="Each day from 30jan,2020 to 3march,2021")
end

# ╔═╡ 6e49c8e0-7d7f-11eb-00f5-b3e9f31291be
begin
	drecovered=[ sum([cases_time_series.dailyrecovered[i-j] for j in 0:6])/7 for i in 	7:400]
	for i in 1:6
		pushfirst!(drecovered,0) 
	end

	plot(1:400,cases_time_series.dailyrecovered,label="Original Values",title="Recovered cases VS Time",lcolor="blue")
	plot!(1:400,drecovered,lw=2,lcolor="red",label="smoothened Values",ylabel="Number of cases",xlabel="Each day from 30jan,2020 to 3march,2021")
end

# ╔═╡ Cell order:
# ╠═9099e9a0-74e9-11eb-103b-41157754968e
# ╠═c5e39340-74e9-11eb-2664-73177a2e5b7f
# ╠═1a1a4170-7ce7-11eb-280f-8b8a2bf10294
# ╠═51f01ec0-7ce8-11eb-0e4b-17cd688ea6c5
# ╠═6109ef30-7ce8-11eb-3dd8-5da2870127fb
# ╠═814c72e0-7ce8-11eb-3949-b9b31c1fb0d0
# ╠═8c575910-7d5c-11eb-3549-5d7694d0af8f
# ╠═e73bee50-7ced-11eb-025d-b58dc8da330f
# ╠═cf177410-7cf3-11eb-306a-ad3a58e98697
# ╠═c5f8bf50-7cf4-11eb-21dd-7bd4beaa699e
# ╠═d1ec4980-7cf4-11eb-022a-abd0d96056f6
# ╠═005550a0-7d7c-11eb-00b5-13d2b3220ada
# ╠═6ba71c70-7d7d-11eb-3a53-038074757fd0
# ╠═0d3c298e-7d7e-11eb-237a-1196960959d3
# ╠═6e49c8e0-7d7f-11eb-00f5-b3e9f31291be
