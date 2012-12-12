require_relative 'spec_helper'

describe Sculptor::Generator do

	describe "integer" do
		it "should return sculptor::generator::integer" do
			Sculptor::Generator.integer.should be_kind_of( Sculptor::Generator::Integer )
		end
	end

	describe "hash" do
		it "should return sculptor::generator::hash" do
			Sculptor::Generator.hash.should be_kind_of( Sculptor::Generator::Hash )
		end
	end

	describe "array" do
		it "should return sculptor::generator::array" do
			Sculptor::Generator.array.should be_kind_of( Sculptor::Generator::Array )
		end
	end

	describe "string" do
		it "should return sculptor::generator::string" do
			Sculptor::Generator.string.should be_kind_of( Sculptor::Generator::String )
		end
	end

end