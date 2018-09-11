class Vertex
  attr_accessor :in_edges, :out_edges
  attr_reader :value
  
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    initialize_edges
  end
  
  def initialize_edges
    from_vertex.each do |vertex|
      vertex.out_edges << self
    end
    to_vertex.each do |vertex| 
      vertex.in_edges << self
    end
  end

  def destroy!
    from_vertex.each do |vertex|
      vertex.out_edges.delet(self)
    end 
    to_vertex.each do |vertex|
      vertex.in_edges.delete(self)
    end
    self.from_vertex = nil
    self.to_vertex = nil 
  end

  private 

  attr_accessor :from_vertex, :to_vertex
end
