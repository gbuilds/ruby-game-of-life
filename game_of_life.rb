# basic file

class World
  attr_accessor :rows, :cols
  
  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
  end
end