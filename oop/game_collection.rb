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

  def to_h(...)
    @list
      .map
      .with_index { |game, index| ["game-#{index}", game.to_h] }
      .to_h
  end

  def to_json(...)
    to_h.to_json(...)
  end
end
