# gosu file

require 'gosu'
require_relative 'game_of_life.rb'

class GameOfLifeWindow < Gosu::Window
  def initialize(height=800, width=600, update_interval=200)
  	@height = height
  	@width = width
    super(height, width, false, update_interval)
    self.caption = "Ruby Game of Life"

    # Color
    @background_color = Gosu::Color.new(0xffdedede)
    @alive_color = Gosu::Color.new(0xff00FF00)
    @dead_color = Gosu::Color.new(0xffCCFFCC)

    # Initializing the game
    @cols = @width / 10
    @rows = @height / 10

    @col_width = @width / @cols
    @row_height = @height / @rows

    @world = World.new(@cols, @rows)
    @game = Game.new(@world)
    @game.world.randomly_populate
  end

  def update
  	@game.tick!
  end

  def draw
  	draw_quad(0, 0, @background_color, 
  		      width, 0, @background_color, 
  		      width, height, @background_color,
  		      0, height, @background_color)

  	@game.world.cells.each do |cell|
  		if cell.alive
  			draw_quad( cell.x * @col_width, cell.y * @row_height, @alive_color,
  				      (cell.x * @col_width) + @col_width, cell.y * @row_height, @alive_color,
  				      (cell.x * @col_width) + @col_width, (cell.y * @row_height) + @row_height, @alive_color,
  				       cell.x * @col_width, (cell.y * @row_height) + @row_height, @alive_color)
  		else
  			draw_quad( cell.x * @col_width, cell.y * @row_height, @dead_color,
  				      (cell.x * @col_width) + @col_width, cell.y * @row_height, @dead_color,
  				      (cell.x * @col_width) + @col_width, (cell.y * @row_height) + @row_height, @dead_color,
  				       cell.x * @col_width, (cell.y * @row_height) + @row_height, @dead_color)
  		end
  	end
  end

  def needs_cursor?; true; end

end

window = GameOfLifeWindow.new
window.show