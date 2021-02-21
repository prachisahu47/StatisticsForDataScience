### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ f44f59e0-7349-11eb-2d6b-45fb88b08d40
begin
	N=2000
	s=[sum([rand(Int32) for j in 1:i])/i for i in 1:N]
end


# ╔═╡ 03fb0a10-734a-11eb-0699-79465ba51682
begin
	using Plots
	scatter(1:N,s,label=["mean"],xlabel="Number of integers choosen")
	plot!(1:N,zeros(N),lw=2,label="The zero line")
end


# ╔═╡ Cell order:
# ╠═f44f59e0-7349-11eb-2d6b-45fb88b08d40
# ╠═03fb0a10-734a-11eb-0699-79465ba51682
