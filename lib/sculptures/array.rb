module Sculptor

  class Array < Sculptor::Sculpture
    
    def initialize
      
      @_from = nil
      @_to = nil
      @_of = nil
      @_non_empty = false
      
      super
    end
    
    def from( min )
      @_from = min
      self
    end
    
    def to( max )
      @_to = max
      self
    end
    
    def of( name )
      self
    end

    def sculpture( s_name )
      @_of = Sculptor.sculpt s_name
      self
    end

    def non_empty
      @_non_empty = true
      self
    end
    
    def compare!( json_string )
      
      json = JSON.parse( json_string )

      # check data type
      raise "Invalid data type '#{ json.class.name }' for node '#{ @_name }'. Expecting 'Array'." unless json.class == Array
      
      raise "Array '#{@_name}' count #{value.count} under minimum of #{@_from}" if json.count < @_min

      raise "Array '#{@_name}' count #{value.count} exceeds maximum of #{@_to}" if json.count > @_max

      raise "Array is '#{@_name}' empty when it shouldn't be" if json.empty?
      
      # check any elements of the array if sculpture provided
      if @_of
        value.each{ |json_object| 
          @_of.compare! json_object 
        }
      end

      super
      
    end

  end

end