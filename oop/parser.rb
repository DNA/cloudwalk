#! /usr/bin/env ruby

require 'set'
require 'json'

require_relative 'game_collection'
require_relative 'kill'

games = GameCollection.new

File.readlines('qgames.log').each do |line|
  timestamp, log = line.chomp.strip.split(' ', 2)

  case log.split(':')
  in ['InitGame', data]
    games.add(timestamp, data)

  in ['ClientUserinfoChanged', data]
    id, player_info = data.split(' ', 2)

    player = games.current.players.find(id)
    player.update(player_info)

  in ['Kill', ids, data]
    killer, victim, mod = ids.split(' ')

    killer = games.current.players.find(killer)
    victim = games.current.players.find(victim)

    games.current.kills << Kill.new(killer, victim, mod)

  else
  end
end


pp games
