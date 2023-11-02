#! /usr/bin/env ruby

require 'set'
require 'json'

games = {}
id = 0
SYSTEM_PLAYER = '<world>'

File.readlines('qgames.log').each do |line|
  timestamp, log = line.chomp.strip.split(' ', 2)

  case log.split(':')
  in ['InitGame', *]
    id += 1

    games[id] = {
      total_kills: 0,
      players: Set.new,
      kills: Hash.new { 0 },
      kills_by_means: Hash.new { 0 },
    }

  in ['Kill', ids, data]
    killer, victim, mod = data.split(/killed|by/).map(&:strip)

    games[id][:players].add(victim)
    games[id][:total_kills] += 1
    games[id][:kills_by_means][mod] += 1

    if killer == SYSTEM_PLAYER
      games[id][:kills][victim] -= 1
    else
      games[id][:kills][killer] += 1
      games[id][:players].add(killer)
    end
  else
  end
end


games
  .transform_keys! { |k| "game-#{k}" }
  .each do |id, game|
    game[:players] = game[:players].to_a.sort
    game[:kills] = game[:kills].sort_by(&:last).reverse.to_h
    game[:kills_by_means] = game[:kills_by_means].sort_by(&:last).reverse.to_h
  end

puts JSON.generate(games)
