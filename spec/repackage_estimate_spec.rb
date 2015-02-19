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
end