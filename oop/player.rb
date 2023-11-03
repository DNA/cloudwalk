
SYSTEM_ID = '1022'

class Player
  attr_accessor :id, :name

  def initialize(id, name='UNKNOWN')
    self.id = id
    self.name = name
  end

  def self.system_player
    @_system ||= new(SYSTEM_ID, '<world>')
  end

  def update(data)
    attrs = data.split('\\').each_slice(2).to_h

    self.name = attrs['n']
  end

  def system?
    self.id == SYSTEM_ID
  end
end
