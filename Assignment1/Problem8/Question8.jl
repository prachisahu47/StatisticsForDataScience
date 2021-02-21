### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 33c656b0-7218-11eb-337f-63b00a004c9c
begin
	using Plots
	pyplot()
end

# ╔═╡ 7b2760b0-7215-11eb-01cb-89f01928e69a
function iswin(x::Int64,y::Int64)
	if x<=y
		return -1
	else
		return 1
	end
end

# ╔═╡ 717c18d0-7215-11eb-1956-97af8ad350fe
begin
	n1=10000000
	th1=0
	β1=1
	p_val=[]
	prob1=[]
	while th1<=100
		num1=0
		tot=0
		for j in 1:n1
			i=1
			f=true
			numP1=0
			numN1=0
			
			while(i<=20 && f)
				(iswin(rand(0:100),th1)==1) ? numP1+=1 : numN1+=1
				if numN1>=numP1+10
					f=false
				end
				i+=1
			end
			if f
				tot+=1
				if numN1<=numP1
					num1+=1
				end
			end
		end
		push!(prob1,num1/tot)
		push!(p_val,0.01*th1)
		th1+=β1
	end
end

# ╔═╡ 759a60c2-726f-11eb-3ee8-cb888804cc3b
function is_win(x::Int64,y::Float64)
	return x>y
end

# ╔═╡ 222fe390-7433-11eb-2a8a-1ba5506b14b0
md"## from Q6"

# ╔═╡ 0a07ed00-726f-11eb-15be-b5d31df66aef
begin
	th=1.0
	β=1.0
	prbplot=[]
	p_values=[]
	while th<=100
		push!(p_values,0.01*th)
		total=[sum([is_win(rand(1:100),th) for i in 1:20]) for j in 1:100000]
		prbly=count(total.>=10)/100000
		th=th+β
		push!(prbplot,prbly)
	end
end

# ╔═╡ 14412500-7217-11eb-3c92-8d3f833bace4
begin
	scatter(p_values,prbplot,label=false)
	plot!(p_values,prbplot,label="without condition from Q6",lw=2,lcolor=:blue)
	scatter!(p_val,prob1,xlabel="P values",label=false,title="probability of money left>=Rs.10 given that no bankrupt")
	plot!(p_val,prob1,label="with condition",lw=2,ylabel="probability",lcolor=:red)
	
end

# ╔═╡ Cell order:
# ╠═7b2760b0-7215-11eb-01cb-89f01928e69a
# ╠═717c18d0-7215-11eb-1956-97af8ad350fe
# ╠═759a60c2-726f-11eb-3ee8-cb888804cc3b
# ╠═222fe390-7433-11eb-2a8a-1ba5506b14b0
# ╠═0a07ed00-726f-11eb-15be-b5d31df66aef
# ╠═33c656b0-7218-11eb-337f-63b00a004c9c
# ╠═14412500-7217-11eb-3c92-8d3f833bace4
