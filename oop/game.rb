
require_relative 'player_collection'
require_relative 'kill_collection'
require_relative 'means_of_death'

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
    mod = MeansOfDeath.by_id(mod)

    self.kills.add(killer, victim, mod)
  end

  def to_h
    {
      total_kills: self.kills.count,
      players: self.players.names,
      score: self.kills.score.transform_keys(&:name),
      kills_by_means: self.kills.by_means
    }
  end

  def to_json(...)
    to_h.to_json(...)
  end
end
