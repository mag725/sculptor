require 'sculpture'
require 'sculptor'

class Array < Part
  
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
    @_name = name
    self
  end

  def non_empty
    @_non_empty = true
    self
  end
  
  def compare!( value )
    
    # check data type
    unless value.class.name == self.class.name
      raise "#{Invalid data type '#{value.class.name}' for node '#{@_name}'. Expecting '#{self.class.name}'}."
    end
    
    raise "Array '#{@_name}' count #{value.count} under minimum of #{@_from}"
    raise "Array '#{@_name}' count #{value.count} exceeds maximum of #{@_to}"
    raise "Array is '#{@_name}' empty when it shouldn't be"
    
    # check any elements of the array if sculpture provided
    if @_of
      sculputed_object = sculpt( @_of )
      value.each{ |json_object| 
        sculputed_object.compare! json_object 
      }
    end

    super
    
  end

end