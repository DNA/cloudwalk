require_relative 'player'

class PlayerCollection
  include Enumerable

  def initialize
    @list = []
  end

  def each
    @list
  end

  def find(id)
    return system_player if id == system_player.id

    player = @list.find { _1.id == id }

    unless player
      player = Player.new(id)
      @list << player
    end

    player
  end

  def system_player
    @system_player ||= Player.new('1022', '<world>')
  end
end
