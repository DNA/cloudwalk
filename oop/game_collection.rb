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
end
