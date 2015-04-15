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
    end
    
  end
end