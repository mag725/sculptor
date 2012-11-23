require_relative 'spec_helper'

describe Sculpture do

	before( :each ) do

		@sculpture = Sculpture.new.called( :object )

		@json = '{"quantity":"1"}'
	
	end

	describe "compare!" do

		it "should error when nil for non-nil" do
			begin
				@sculpture.compare! nil
			rescue Exception => e
				e.message.should eq( "Nil value for non-nil sculpture '#{ @sculpture.name }'" )
			end
		end

		it "should error when empty string for non-nil" do
			begin
				@sculpture.compare! ''
			rescue Exception => e
				e.message.should eq( "Nil value for non-nil sculpture '#{ @sculpture.name }'" )
			end
		end

	end

	describe "non-nil" do

		it "set non-nil to true" do
			expect{ @sculpture.non_nil }.to change{ @sculpture.non_nil? }.from( false ).to( true )
		end

		it "should return self" do
			@sculpture.non_nil.should be( @sculpture )
		end

	end

	describe "called" do

		it "should change names" do
			expect{ @sculpture.called( :test ) }.to change{ @sculpture.name }.from( :object ).to( :test )
		end

		it "should return self" do
			@sculpture.called( :xyz ).should be( @sculpture )
		end

	end

end