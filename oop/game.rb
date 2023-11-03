
require_relative 'player_collection'
require_relative 'kill_collection'

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
    @_kills ||= KillCollection.new
  end

  def add_kill(killer, victim, mod)
    killer = self.players.find(killer)
    victim = self.players.find(victim)

    self.kills.add(killer, victim, mod)
  end

  def to_h
    {
      total_kills: self.kills.count,
      players: self.players.names,
      score: self.kills.score.transform_keys(&:name),
    }
  end

  def to_json(...)
    self.to_h.to_json(...)
  end
end
