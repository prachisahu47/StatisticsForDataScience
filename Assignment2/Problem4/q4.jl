### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c3644e40-7a82-11eb-3090-5f014bf6b3f1
using DataFrames

# ╔═╡ 8df93320-7d65-11eb-2d78-d7ca52f809ef
using HTTP

# ╔═╡ b620bda0-7d65-11eb-3628-5be231163cf0
using JSON

# ╔═╡ bae68310-7d65-11eb-0b4c-119a26780a19
r_link="https://api.covid19india.org/data.json"

# ╔═╡ bfc32be0-7d65-11eb-2562-ef939b1003f6
response=HTTP.get(r_link)

# ╔═╡ c6ef69fe-7d65-11eb-3d86-4995cb575948
str=String(response.body)

# ╔═╡ d2fbac50-7d65-11eb-2a8a-f9e5916980ba
data=JSON.Parser.parse(str)

# ╔═╡ d95b72b0-7d65-11eb-0a19-637c96e27b02
cases_time_series=vcat(DataFrame.(data["cases_time_series"])...)

# ╔═╡ de861470-7d65-11eb-1fd8-152017eb17b2
date_yyyy_mm=[i[1:7] for i in cases_time_series.dateymd]

# ╔═╡ 09ef3560-7d66-11eb-2f60-6508096522b8
cases_time_series[!,"year_month"]=date_yyyy_mm

# ╔═╡ 2ad15470-7d66-11eb-3534-b7c8908467a9
cases_time_series.dailyconfirmed = passmissing(parse).(Int, cases_time_series.dailyconfirmed)

# ╔═╡ 47e813a0-7d66-11eb-10b9-4f2a7bf9b516
cases_time_series.dailydeceased = passmissing(parse).(Int, cases_time_series.dailydeceased)

# ╔═╡ 4f3aec90-7d66-11eb-1f72-1bdca1893f9a
cases_time_series.dailyrecovered = passmissing(parse).(Int, cases_time_series.dailyrecovered)

# ╔═╡ 56f82010-7d66-11eb-3c72-d541358c3d47
Req_data=select(cases_time_series,"year_month","dailyconfirmed","dailydeceased","dailyrecovered")

# ╔═╡ 6852dfd0-7d66-11eb-0484-77f812778b12
grpCts=groupby(Req_data,:year_month)

# ╔═╡ 83f54e80-7d66-11eb-2996-675f3ef2fc1e
final_data=combine(grpCts,[:dailyconfirmed,:dailydeceased,:dailyrecovered].=>sum)

# ╔═╡ Cell order:
# ╠═c3644e40-7a82-11eb-3090-5f014bf6b3f1
# ╠═8df93320-7d65-11eb-2d78-d7ca52f809ef
# ╠═b620bda0-7d65-11eb-3628-5be231163cf0
# ╠═bae68310-7d65-11eb-0b4c-119a26780a19
# ╠═bfc32be0-7d65-11eb-2562-ef939b1003f6
# ╠═c6ef69fe-7d65-11eb-3d86-4995cb575948
# ╠═d2fbac50-7d65-11eb-2a8a-f9e5916980ba
# ╠═d95b72b0-7d65-11eb-0a19-637c96e27b02
# ╠═de861470-7d65-11eb-1fd8-152017eb17b2
# ╠═09ef3560-7d66-11eb-2f60-6508096522b8
# ╠═2ad15470-7d66-11eb-3534-b7c8908467a9
# ╠═47e813a0-7d66-11eb-10b9-4f2a7bf9b516
# ╠═4f3aec90-7d66-11eb-1f72-1bdca1893f9a
# ╠═56f82010-7d66-11eb-3c72-d541358c3d47
# ╠═6852dfd0-7d66-11eb-0484-77f812778b12
# ╠═83f54e80-7d66-11eb-2996-675f3ef2fc1e
