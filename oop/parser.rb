#! /usr/bin/env ruby

require 'set'
require 'json'

require_relative 'game'
require_relative 'kill'

games = []
current = nil

File.readlines('qgames.log').each do |line|
  timestamp, log = line.chomp.strip.split(' ', 2)

  case log.split(':')
  in ['InitGame', data]
    current = Game.new(timestamp, data)
    games << current

  in ['ClientUserinfoChanged', data]
    id, player_info = data.split(' ', 2)

    player = current.players.find(id)
    player.update(player_info)

  in ['Kill', ids, data]
    killer, victim, mod = ids.split(' ')

    killer = current.players.find(killer)
    victim = current.players.find(victim)

    current.kills << Kill.new(killer, victim, mod)

  else
  end
end


pp games
