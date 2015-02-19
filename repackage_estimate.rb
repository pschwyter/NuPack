class RepackageEstimate
	attr_reader :base_cost, :num_people, :category

	def initialize(base_cost,num_people,category)
		@base_cost = base_cost
		@num_people = num_people
		@category = category
	end

	def estimate
		# format user inputs
		format_base_cost
		format_category
		format_num_people

		flat_markup = 0.05
		# flat markup is calculated first
		estimate = base_cost * (1 + flat_markup)

		# calculate all other markups on top of base markup
		estimate = estimate * (1 + labour_markup + category_markup)
		
		convert_to_dollars(estimate)
	end

	private

	def format_base_cost
		if @base_cost.class == String
			@base_cost = @base_cost.gsub(/[^\d.]/,'').to_f
		end
		@base_cost
	end

	def format_category
		@category.downcase!
	end

	def format_num_people
		if @num_people.class == String
			@num_people = @num_people.gsub(/[^\d]/,'').to_i
		end
		@num_people
	end


	def convert_to_dollars(unformated_cost)
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
