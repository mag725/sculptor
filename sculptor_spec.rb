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

      Sculptor.sculpture_named( :product ).class.should be( Sculpture )

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
  
  describe 'object' do
    
  end
  
  describe 'collection' do
  
  end
    
  describe 'sculpt' do
    
  end
    
end
