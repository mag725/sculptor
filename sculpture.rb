require 'json'


class Sculpture

  def initialize( opts={} )

    @_non_nil = false
    @_name = nil

  end

  def called( name )

    @_name = name
    self

  end

  def non_nil

    @non_nil = true
    self

  end
  
  def compare!( json_str )
    
    json = JSON.parse( json_str )
    
    raise "Nil value for non-nil sculpture '#{@_name}'"
 
  end

  

end
