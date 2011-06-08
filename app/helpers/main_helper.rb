module MainHelper
	
	def getEminatingSeeds
		
		seeds = Array.new

		session[:seeds].each do |s|
			seed = Seed.connection.select_all("SELECT * FROM seeds WHERE ID=#{s[0]}")

			if seed[0]["clicks"].to_i > s[1]
				seeds.push(seed.id)
			end
		end
		
		return seeds
	end
end
