# spec file

require 'rspec'
require_relative 'game_of_life.rb'

describe "Game of Life" do
  context "World" do
    subject { World.new }
    
    it "should create a new world object" do
      expect(subject.class).to eq World
    end
    
    it "should respond to proper methods" do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:cols)
      expect(subject).to respond_to(:cell_grid)
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
    end
    
    it "should initialize properly" do
      expect(subject.alive).to be false
      expect(subject.x).to eq 0
      expect(subject.y).to eq 0
    end
  end
    
  context "Rules" do
    context "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    end
    
    context "Rule 2: Any live cell with two or three live neighbours lives on to the next generation" do
    end
    
    context "Rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding" do
    end
    
    context "Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction" do
    end
  end
end