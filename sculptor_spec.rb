require_relative 'spec_helper'

describe 'sculptor' do
  
  describe 'define' do

    before( :each ) do

      @objects = {}
      @objects.stub!( :[] ).with( :product ).and_return( @sculpture )

    end

    it "should store store sculpture in @_sculpture_objects" do

      Sculptor.define do
        object :product do
        end
      end

      Sculptor.sculpt( :product ).class.should be( Sculpture )

    end

    it "should execute the block" do
      
      @block = Proc.new do
      end
      @block.should_receive( :instance_eval )
      Sculpture.stub!( :new ).and_return( @block )
      Sculptor.define do
        object :product do
        end
      end

    end
  end
  
  describe 'collection' do
  
  end
    
  describe 'sculpt' do

    before( :each ) do
      Sculptor.define do
        object :product do
        end
      end
    end
    
    it "should return an instance of sculpture" do

      Sculptor.sculpt( :product ).class.should be( Sculpture )

    end

    it "should raise an error for unregistered sculptures" do

      expect{
        Sculpture.sculpt( :fake )
      }.to raise_error

    end

  end
    
end
