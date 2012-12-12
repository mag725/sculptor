require_relative 'spec_helper'

describe Sculptor do
  
  describe 'define' do

    before( :each ) do

      @objects = {}
      @block = Proc.new do
      end
      @objects.stub!( :[] ).with( :product ).and_return( @sculpture )

    end

    it "should evaluate the block" do

      Sculptor.should_receive( :module_eval )
      Sculptor.define do
      end

    end

  end
  
  describe 'sculpture' do
    
    before( :each ) do

      @generator = Sculptor::Generator::Hash.new
      Sculptor::Generator::Hash.stub!( :new ).and_return( @generator )

    end

    it "should instantiate a new sculpture::generator::hash" do
      Sculptor::Generator::Hash.should_receive( :new )
      Sculptor.define do
        sculpture :product do
        end
      end
    end

    it "should execute the block in context the generator instance" do
      @generator.should_receive( :instance_eval )
      Sculptor.define do
        sculpture :product do
        end
      end
    end

  end
  
  pending 'collection'
    
  describe 'sculpt' do
    
    before( :each ) do
      Sculptor.define do
        sculpture :product do
        end
      end
    end

    it "should error out on unregistered sculpture" do

      expect{
        Sculptor.sculpt( :fake )
      }.to raise_error

    end

    it "should return sculpture::hash" do

      Sculptor.sculpt( :product ).should be_kind_of( Sculpture::Hash )

    end
 
  end
    
end