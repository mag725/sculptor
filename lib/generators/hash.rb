module Sculptor

	module Generator

		class Hash < Generator

			def initialize( args={} )

				super( args )				
				@_base_sculpture = Sculptor::Sculpture::Hash.new
				self

			end

			def needs( sculpture )
		      	@_base_sculpture.required_sub_sculptures[ sculpture.name ] = sculpture
		      	self
		    end
		    
		    def may_have( sculpture )
		      	@_base_sculpture.x boptional_sub_sculptures[ sculpture.name ] = sculpture
		      	self
		    end

		end

	end

end