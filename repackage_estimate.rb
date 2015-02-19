class RepackageEstimate
	attr_reader :base_cost, :num_people, :category

	def initialize(base_cost,num_people,category)
		@base_cost = base_cost
		@num_people = num_people
		@category = category
	end

	def repackage_cost
		flat_markup = 0.05
		# flat markup is calculated first
		cost = base_cost * (1 + flat_markup)

		# calculate all other markups on top of base markup
		cost = cost * (1 + labour_markup + category_markup)
		
		format_dollar_amount(cost)
	end

	def format_dollar_amount(unformated_cost)
		rounded_cost = unformated_cost.round(2)
		"$#{rounded_cost}"
	end

	def labour_markup
		@num_people * 0.012
	end

	def category_markup
		case @category
		when 'drugs'
			0.075
		when 'food'
			0.13
		when 'electronics'
			0.02
		else
			0
		end
	end

end
