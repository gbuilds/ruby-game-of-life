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
    end
    
    it "should initialize properly" do
      expect(subject.alive).to be false
    end
  end
end