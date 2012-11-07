require_relative 'spec_helper'

describe 'sculptor' do
  
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
  
  describe 'object' do
    
    before( :each ) do

      @objects = {}
      @block = Proc.new do
      end
      @objects.stub!( :[] ).with( :product ).and_return( @sculpture )

    end

    it "should execute the block" do

      s = Sculpture.new      
      s.should_receive( :instance_eval )

      Sculpture.stub!( :new ).and_return( s )
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

    it "should error out on unregistered sculpture" do

      expect{
        Sculptor.sculpt( :fake )
      }.to raise_error

    end

    it "should return sculpture" do

      Sculptor.sculpt( :product ).class.should be( Sculpture )

    end
 
  end
    
end
