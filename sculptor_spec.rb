require_relative 'spec_helper'

describe 'sculptor' do
  
  describe 'define' do
    before( :all ) do
      Sculptor.define do
        object :product do
          puts 'test'
        end
      end
    end

    it "create object with name" do
      
      @_sculpture_objects[:product].should_not be_nil
      
    end
  end
  
  describe 'object' do
    
  end
  
  describe 'collection' do
  
  end
    
  describe 'sculpt' do
    
  end
    
end
