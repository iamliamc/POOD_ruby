class Gear
  attr_reader :chainring, :cog, :wheel

  # There’s a simple way to avoid depending on fixed-order arguments. If you have control over the Gear initialize method,
  # change the code to take a hash of options instead of a fixed list of parameters.

  # depending on needs: take a few fixed-order arguments, followed by an options hash.

  def initialize(args)
    @chainring  = args[:chainring]
    @cog        = args[:cog]
    @wheel      = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def diameter
    # tire goes around rim twice for diameter
    rim + (tire * 2)
  end

  def gear_inches
    ratio * diameter
  end

  # isolate dependency
  # This technique becomes necessary when a class contains embedded references to a message that is likely to change.

  def diameter
    wheel.diameter
  end
end
