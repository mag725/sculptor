module Sculptor

	module Generator

		class Generator

			def base_sculpture
				@_base_sculpture
			end

		end

		def integer
			Sculptor::Sculpture::Integer.new
		end

		def hash
			Sculptor::Sculpture::Hash.new
		end

		def array
			Sculptor::Sculpture::Array.new
		end

		def string
			Sculptor::Sculpture::String.new
		end

	end

end