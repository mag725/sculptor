require 'JSON'
require_relative 'sculpture'

module Sculptor

  @_sculpture_objects = {}
  @_sculpture_collections = {}

  def self.sculpt( name )
    @_sculpture_objects[ name ] or raise "Sculpture '#{name}' not registered." 
  end

  def self.define( &block )
    self.module_eval( &block )
  end
  
  def self.object( name, &block )
    s = Sculpture::Hash.new
    s.instance_eval( &block )
    @_sculpture_objects[ name ] = s
  end
   
  def self.collection( name, &block )
    s = Sculpture::Array.new
    s.instance_eval( &block )
    @_sculpture_objects[ name ] = s
  end
      
end
