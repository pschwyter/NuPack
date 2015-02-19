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

		it "should return the correct cost when passed a 'food' estimate" do
			food_estimate = RepackageEstimate.new('$1299.99','3 people', 'food')
			expect(food_estimate.estimate).to eq('$1591.58')
		end

		it "should return the correct cost when passed a 'drugs' estimate" do
			drugs_estimate = RepackageEstimate.new('$5432.00','1 person', 'drugs')
			expect(drugs_estimate.estimate).to eq('$6199.81')
		end

		it "should return the correct cost when passed a 'books' estimate" do
			books_estimate = RepackageEstimate.new('$12456.95','4 people', 'books')
			expect(books_estimate.estimate).to eq('$13707.63')
		end
	end
end