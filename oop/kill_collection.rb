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
end
