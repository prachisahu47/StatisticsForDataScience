### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 4dacd590-72bd-11eb-2bbb-0f02eaf18964
begin
letters=[i for i in 1:78]
password=[42,18,1,3,8,9,65,54]
n=10000000
num=0
for i in 1:n
	trial=[rand(letters) for j in 1:8]
	if count(password-trial.==[(0)])>1
		num+=1
	end
end
probability=num/n
end

# ╔═╡ Cell order:
# ╠═4dacd590-72bd-11eb-2bbb-0f02eaf18964
