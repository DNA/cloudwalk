
require_relative 'player_collection'

class Game
  attr_accessor :timestamp, :data

  def initialize(timestamp, data)
    self.timestamp = timestamp
    self.data = data
  end

  def players
    @_players ||= PlayerCollection.new
  end

  def kills
    @_kills ||= []
  end
end
