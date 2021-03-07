### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 6df2b1c0-7b1a-11eb-1264-9bae5f73e9a3
using DataFrames

# ╔═╡ c2af8120-7b1a-11eb-0916-8b866ece6203
df=DataFrame(
	:religion=>[],
	Symbol("<\$10k")=>[],
	Symbol("\$10-20k")=>[],
	Symbol("\$20-30k")=>[],
	Symbol("\$30-40k")=>[],
	Symbol("\$40-50k")=>[],
	Symbol("\$50-75k")=>[],
	Symbol("\$75-100k")=>[],
	Symbol("\$100-150k")=>[],
	Symbol(">\$150k")=>[]
)

# ╔═╡ c1139e0e-7b5f-11eb-0d5a-4502a0631b12
begin
	push!(df,("Agnostic",27, 34, 60, 81, 76, 137,65,34,99))
	push!(df,("Atheist",12, 27, 37, 52, 35, 70,66,71,90))
	push!(df,("Buddhist", 27, 21, 30, 34, 33, 58,7,37,80))
	push!(df,("Catholic", 418, 617, 732, 670, 638, 1116,567,268,874))
	push!(df,("Don’t know/refused", 15, 14, 15, 11, 10, 35,65,23,73))
	push!(df,("Evangelical Prot", 575, 869, 1064, 982, 881, 1486,548,423,908))
	push!(df,("Hindu", 1, 9, 7, 9, 11, 34,6,31,40))
	push!(df,("Historically Black Prot", 228, 244, 236, 238, 197, 223,916,749,264))
	push!(df,("Jehovah’s Witness", 20, 27, 24, 24, 21, 30,61,90,55))
	push!(df,("Jewish", 19, 19, 25, 25, 30, 95,20,36,17))
end

# ╔═╡ 621f4500-7b62-11eb-2a3b-cde545225679
df1=sort(stack(df,2:10,:religion))

# ╔═╡ c45d9190-7b62-11eb-2c73-fb5319776bb2
rename!(df1,:variable=>:income,:value=>:freq)

# ╔═╡ Cell order:
# ╠═6df2b1c0-7b1a-11eb-1264-9bae5f73e9a3
# ╠═c2af8120-7b1a-11eb-0916-8b866ece6203
# ╠═c1139e0e-7b5f-11eb-0d5a-4502a0631b12
# ╠═621f4500-7b62-11eb-2a3b-cde545225679
# ╠═c45d9190-7b62-11eb-2c73-fb5319776bb2
