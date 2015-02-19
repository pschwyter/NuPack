class RepackageEstimate
	attr_reader :base_cost, :num_people, :category

	def initialize(base_cost,num_people,category)
		@base_cost = base_cost
		@num_people = num_people
		@category = category
	end

end
