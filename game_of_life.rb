# basic file

class Game
  attr_accessor :world, :seeds
  
  def initialize(world=World.new, seeds=[])
    @world = world
    @seeds = seeds
    
    seeds.each do |seed|
      world.cell_grid[seed[0]][seed[1]].alive = true
    end
  end
end

class World
  attr_accessor :rows, :cols, :cell_grid
  
  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    
    # [[Cell.new, Cell.new, Cell.new],
    #  [Cell.new, Cell.new, Cell.new],
    #  [Cell.new, Cell.new, Cell.new]]
    
    
    @cell_grid = Array.new(rows) do |row| 
        Array.new(cols) do |col|
          Cell.new(col, row)
        end
    end
  end
  
  def live_neighbors_around_cell(cell)
    live_neighbors = []
    
    # It detects a neighbor to the north
    if cell.y > 0
      candidate = self.cell_grid[cell.y - 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end
    
    if cell.y < self.cell_grid.length
      candidate = self.cell_grid[cell.y + 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end
    
    if cell.x > 0
      candidate = self.cell_grid[cell.y][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end
    
    if cell.x < self.cell_grid[0].length
      candidate = self.cell_grid[cell.y][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end
    
    live_neighbors
  end
 
end


class Cell
  attr_accessor :alive, :x, :y
  
  def initialize(x=0, y=0)
    @alive = false
    @x = x
    @y = y
  end
  
  def alive?
    alive
  end
  
  def dead?
    !alive
  end
end