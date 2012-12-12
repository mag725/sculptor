module Sculptor

  class Hash < Sculptor::Sculpture

    def initialze
      
      # constraints
      @_required_sub_sculptures = {}
      @_optional_sub_sculptures = {}
      @_non_empty = false

    end


    #
    # setters / getters
    #

    def required_sub_sculptures
      @_required_sub_sculptures
    end

    def optional_sub_sculptures
      @_optional_sub_sculptures
    end
    
    #
    # compare!
    #

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

end