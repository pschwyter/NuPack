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

	describe "#repackage_cost" do

		before :each do
			@repackage_estimate = RepackageEstimate.new('$1299.99','3 people', 'food')
		end

		it "should return the correct cost when passed a 'food' estimate" do
			food_estimate = RepackageEstimate.new(1299.99,'3 people', 'food')
			expect(food_estimate.repackage_cost).to eq('$1591.58')
		end

		it "should return the correct cost when passed a 'drugs' estimate" do
			food_estimate = RepackageEstimate.new(5432,'1 person', 'drugs')
			expect(food_estimate.repackage_cost).to eq('$6199.81')
		end

		it "should return the correct cost when passed a 'books' estimate" do
			food_estimate = RepackageEstimate.new(12456.95,'4 people', 'books')
			expect(food_estimate.repackage_cost).to eq('$13707.63')
		end
	end
end