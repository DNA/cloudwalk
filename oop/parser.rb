#! /usr/bin/env ruby

require 'json'

require_relative 'game_collection'

games = GameCollection.new

File.readlines('qgames.log').each do |line|
  timestamp, log = line.chomp.strip.split(' ', 2)

  case log.split(':')
  in ['InitGame', data]
    games.add(timestamp, data)

  in ['ClientUserinfoChanged', data]
    id, info = data.split(' ', 2)

    player = games.current.update_player(id, info)

  in ['Kill', ids, data]
    killer, victim, mod = ids.split(' ')

    killer = games.current.add_kill(killer, victim, mod)

  else
  end
end


pp games
