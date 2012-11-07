require 'sculpture'

class Hash < Sclupture

  def initialze
    
    # constraints
    @_required_sub_sculptures = {}
    @_optional_sub_sculptures = {}
    @_non_empty = false

  end

  def with

  end

  def non_empty
  	@_non_empty = true
  	self
  end

  def needs( sculpture )
    @_required_sub_sculptures[ sculpture.name ] = sculpture
    self
  end
  
  def may_have( sculpture )
    @_optional_sub_sculptures[ sculpture.name ] = sculpture
    self
  end
  
  def compare!( value )
    
    super( value )
 
    required_keys = @_required_sub_sculptures.keys
    
    json.each_pair{ |k,v| 
      
      ( sub = @_required_sub_sculptures[ k ] || sub = @_optional_sub_sculptures[ k ] ) or raise "Unregistered attribute in JSON #{ k }"
      sub.compare!( v )
      required_keys.delete( k )
    
    }
    
    raise "Missing required key(s): #{required_keys.join(', ')}" if required_keys.count > 0
   
  end

end