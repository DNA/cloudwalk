require_relative 'game'

class GameCollection
  include Enumerable

  def initialize
    @list = []
  end

  def add(timestamp, data)
    @list << Game.new(timestamp, data)
  end

  def current
    @list.last
  end

  def to_json(...)
    @list
      .map
      .with_index { |game, index| ["game-#{index}", game.to_h] }
      .to_h
      .to_json(...)
  end
end
