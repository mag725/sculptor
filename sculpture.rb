require 'json'

class Sculpture

  def initialize( opts={} )

    @_non_nil = false
    @_name = nil
    @_sub_sculptures = []

  end

  def name
    @_name
  end

  def non_nil?
    @_non_nil
  end

  def called( name )

    @_name = name
    self

  end

  def non_nil

    @_non_nil = true
    self

  end
  
  def compare!( json_str )
    
    raise "Nil value for non-nil sculpture '#{@_name}'" if json_str == '' || json_str == nil
    json = JSON.parse( json_str )
     
  end

  

end
