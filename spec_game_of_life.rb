# spec file

require 'rspec'
require_relative 'game_of_life.rb'

describe "Game of Life" do
  
  let!(:world) { World.new }
  let!(:cell) { Cell.new(1, 1) }
  
  context "World" do
    subject { World.new }
    
    it "should create a new world object" do
      expect(subject.class).to eq World
    end
    
    it "should respond to proper methods" do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:cols)
      expect(subject).to respond_to(:cell_grid)
      expect(subject).to respond_to(:live_neighbors_around_cell)
    end
    
    it "should create proper cell grid on initialize" do
      expect(subject.cell_grid.is_a?(Array)).to be true
      subject.cell_grid.each do |row|
        expect(row.is_a?(Array)).to be true
        row.each do |col|
          expect(col.is_a?(Cell)).to be true
        end
      end
    end
    
    it "should detect a neighbor to the north" do
      subject.cell_grid[cell.y - 1][cell.x].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
        
    it "should detect a neighbor to the north-east" do
      subject.cell_grid[cell.y - 1][cell.x + 1].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the east" do
      subject.cell_grid[1][2].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the south-east" do
      subject.cell_grid[2][2].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the south" do
      subject.cell_grid[2][1].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the south-west" do
      subject.cell_grid[2][0].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the west" do
      subject.cell_grid[1][0].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
    it "should detect a neighbor to the north-west" do
      subject.cell_grid[0][0].alive = true
      expect(subject.live_neighbors_around_cell(cell).count).to eq 1
    end
    
  end
  
  context "Cell" do
    subject { Cell.new }
    
    it "should create a new cell object" do
      expect(subject.class).to eq Cell
    end
    
    it "should respond to proper methods" do
      expect(subject).to respond_to(:alive)
      expect(subject).to respond_to(:x)
      expect(subject).to respond_to(:y)
      expect(subject).to respond_to(:alive?)
    end
    
    it "should initialize properly" do
      expect(subject.alive).to be false
      expect(subject.x).to eq 0
      expect(subject.y).to eq 0
    end
  end
  
  context "Game" do
    subject { Game.new }
    
    it "should create a new game object" do
      expect(subject.class).to eq Game
    end
    
    it "should respond to proper methods" do
      expect(subject).to respond_to(:world)
      expect(subject).to respond_to(:seeds)
    end
    
    it "should initialize properly" do
      expect(subject.world.class).to eq World
      expect(subject.seeds.class).to eq Array
    end
    
    it "should plant seeds properly" do
      game = Game.new(world, [[1, 2], [0, 2]])
      expect(world.cell_grid[1][2]).to be_alive
      expect(world.cell_grid[0][2]).to be_alive
    end
  end
  
  context "Rules" do
    
    let!(:game) { Game.new }
  
    context "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
      it "should kill a live cell with 1 live neighbor" do
        game = Game.new(world, [[1, 0], [2, 0]])
        game.tick!
        expect(world.cell_grid[1][0]).to be_dead
        expect(world.cell_grid[2][0]).to be_dead
      end
    end
    
    context "Rule 2: Any live cell with two or three live neighbours lives on to the next generation" do
    end
    
    context "Rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding" do
    end
    
    context "Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproductiong" do
    end
  end
end