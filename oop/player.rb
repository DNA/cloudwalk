class Player
  attr_accessor :id, :name

  def initialize(id, name='UNKNOWN')
    self.id = id
    self.name = name
  end

  def update(data)
    attrs = data.split('\\').each_slice(2).to_h

    self.name = attrs['n']
  end

  def parse_info(data)
  end
end
