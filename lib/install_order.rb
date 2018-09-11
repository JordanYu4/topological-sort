# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, install_order determines 
# the order in which the packages should be installed. Only packages 
# that have dependencies will be listed, but all packages from 
# 1..max_id exist. 

require_relative 'graph'

def install_order(arr)
  vertices = {}
  edges = []
  arr.each do |tup|
    pack_id, dependency = tup[0], tup[1]
    from_vertex = vertices[dependency] || Vertex.new(dependency) 
    to_vertex = Vertex.new(pack_id)
    edges << Edge.new(from_vertex, to_vertex)
    vertices[pack_id] = to_vertex
    vertices[dependency] = from_vertex
  end 
end
