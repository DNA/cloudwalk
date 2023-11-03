class Kill
  attr_accessor :killer, :victim, :mod

  def initialize(killer, victim, mod)
    self.killer = killer
    self.victim = victim
    self.mod = mod
  end
end
