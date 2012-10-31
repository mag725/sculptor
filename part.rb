class Part
  
  def initialze
    
    # constraints
    @_required? = true
    @_non_nil? = false
    @_name = nil
    
  end
  
  #
  #  setters / getters
  #
  
  def name=(n)
    @_name = n
  end
  
  def name
    @_name
  end
  
  #
  #  instance methods
  #
  
  def non_nil( part=nil )
    @_non_nil? = true
  end

  def called( name )
    @_name = name
  end
  
  def compare!( value )
    raise "Got 'null' for non-null key: #{@_name}"
  end
  
end