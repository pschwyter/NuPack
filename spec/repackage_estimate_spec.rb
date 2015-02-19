require 'spec_helper'

describe RepackageEstimate do
	describe "#new" do
		before :each do
			@repackage_estimate = RepackageEstimate.new(1,2,'food')
		end

		it "should return a RepackageEstimate object" do
			expect(@repackage_estimate).to be_a(RepackageEstimate) 
		end
	end

	describe "#estimate" do

		describe "given the provided examples" do
			it "should return the correct cost when passed the 'food' example" do
				food_estimate = RepackageEstimate.new('$1299.99','3 people', 'food')
				expect(food_estimate.estimate).to eq('$1591.58')
			end

			it "should return the correct cost when passed the 'drugs' example" do
				drugs_estimate = RepackageEstimate.new('$5432.00','1 person', 'drugs')
				expect(drugs_estimate.estimate).to eq('$6199.81')
			end

			it "should return the correct cost when passed the 'books' example" do
				books_estimate = RepackageEstimate.new('$12456.95','4 people', 'books')
				expect(books_estimate.estimate).to eq('$13707.63')
			end
		end

		# testing the electronics category
		it "should return the correct cost when passed an 'electronics' estimate" do
			electronics_estimate = RepackageEstimate.new('$5752.95','3 people', 'electronics')
			expect(electronics_estimate.estimate).to eq('$6378.87')
		end		

		# testing category capitalization
		it "should return the correct cost when base_cost is an integer" do
			books_estimate = RepackageEstimate.new(12456.95,'4 people', 'Books')
			expect(books_estimate.estimate).to eq('$13707.63')
		end

		# testing integer datatypes
		it "should return the correct cost when base_cost is an integer" do
			books_estimate = RepackageEstimate.new(12456.95,'4 people', 'books')
			expect(books_estimate.estimate).to eq('$13707.63')
		end

		it "should return the correct cost when num_people is an integer" do
			books_estimate = RepackageEstimate.new('$12456.95',4, 'books')
			expect(books_estimate.estimate).to eq('$13707.63')
		end		

	end

end









