require 'JSON'
require_relative 'sculpture'

module Sculptor

  @_sculpture_objects = {}
  @_sculpture_collections = {}

  def self.sculpture_named( name )
    @_sculpture_objects[name]
  end

  def self.define( &block )
    self.module_eval( &block )
  end
  
  def self.object( name, &block )
    @_sculpture_objects[name] = s = Sculpture.new and s.instance_eval( &block ) and s
  end
   
  def collection( name, &block )
    @_sculpture_collections[name] = Sculpture.new.instance_eval( &block )
  end
  
  def sculpt( name )
    
    s = @_sculpture_objects[name] or raise "Sculpture '#{name}' not registered."
    instance_eval( s )
    
  end   
      
end
