
require_relative 'player_collection'
require_relative 'kill'

class Game
  attr_accessor :timestamp, :data

  def initialize(timestamp, data)
    self.timestamp = timestamp
    self.data = data
  end

  def players
    @_players ||= PlayerCollection.new
  end

  def update_player(id, info)
    player = self.players.find(id)
    player.update(info)
  end

  def kills
    @_kills ||= []
  end

  def add_kill(killer, victim, mod)
    killer = self.players.find(killer)
    victim = self.players.find(victim)

    self.kills << Kill.new(killer, victim, mod)
  end
end
