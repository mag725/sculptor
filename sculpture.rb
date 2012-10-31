require 'json'


class Sculpture

  def initialze
    
    # constraints
    @_required_parts = {}
    @_optional_parts = {}
    
  end

  def needs( part )
    @_required_parts[ sculpture.name ] = part
    self
  end
  
  def may_have( part )
    @_optional_parts[ sculpture.name ] = part
    self
  end
  
  def compare!( json_str )
    
    json = JSON.parse( json_str )
    
    required_keys = @_required_parts.keys
    
    json.each_pair{ |k,v| 
      ( part = @_required_parts[k] || part = @_optional_parts[k] ) or raise "Unregistered attribute in JSON #{k}"
      part.compare!( v )
      required_keys.delete( k )
    }
    
    raise "Missing required key(s): #{required_keys.join(', ')}" if required_keys.count > 0
    
  end

  

end
