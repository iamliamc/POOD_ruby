class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]
    @tire_size  = args[:tire_size]
  end

  def spares
    {
      chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color
    }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    {
    chain:      chain,
    tire_size:  tire_size,
    tape_color: tape_color
    }
  end
end

class MountainBike < Bicycle
  attr_reader :front_shocks, :rear_shocks

  def initialize(args)
    @front_shocks = args[:front_shocks]
    @rear_shocks  = args[:rear_shocks]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end

bike = Bicycle.new(
  size:         'M',
  tape_color:   'red'
)

p bike.size
p bike.spares
