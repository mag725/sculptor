require_relative 'sculpture'
require_relative 'generator'

module Sculptor

  @_sculpture_objects = {}
  @_sculpture_collections = {}

  def self.sculpt( name )
    @_sculpture_objects[ name ] or raise "Sculpture '#{name}' not registered." 
  end

  def self.define( &block )
    self.module_eval( &block )
  end
  
  def self.sculpture( name, &block )
    g = Sculpture::Generator::Hash.new
    s = g.instance_eval( &block ) || g.base_sculpture
    @_sculpture_objects[ name ] = s
  end
   
  def self.collection( name, &block )
    g = Sculpture::Generator::Array.new
    s = g.instance_eval( &block ) || g.base_sculpture
    @_sculpture_objects[ name ] = s
  end
      
end