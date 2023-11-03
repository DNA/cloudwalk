require_relative 'kill'

class KillCollection
  include Enumerable

  attr_reader :list

  def initialize
    @list = []
  end

  def each
    @list
  end

  def count
    @list.count
  end

  def add(killer, victim, mod)
    @list << Kill.new(killer, victim, mod)
  end

  def score
    system_kills, player_kills = @list.partition { _1.killer.system? }

    system_kills = system_kills.group_by(&:victim).map{ |k, v| [k, v.count] }.to_h

    player_kills
      .group_by(&:victim)
      .map{ |k, v| [k, v.count] }
      .sort_by(&:last)
      .reverse
      .to_h
      .merge(system_kills) { |player, player_kills, system_kills| player_kills - system_kills }
  end
end
