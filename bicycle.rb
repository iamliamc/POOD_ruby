require 'date'
require './schedule'
class Bicycle
  include Schedulable
  attr_reader :size, :chain, :tire_size, :schedule

  def initialize(args={})
    @size       = args[:size]
    @chain      = args[:chain]      || default_chain
    @tire_size  = args[:tire_size]  || default_tire_size
    @schedule   = args[:schedule]   || Schedule.new

    post_initialize(args)
  end

  def lead_days
    1
  end

  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    # raise NotImplementedError,
    #   "This #{self.class} cannot respond to:"
    '24'
  end

  def spares
    {
      chain:      chain,
      tire_size:  tire_size
    }.merge(local_spares)
  end
end

class Vehicle
  include Schedulable
  def lead_days
    3
  end
end

class Mechanic
  include Schedulable
  def lead_days
    4
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    {rear_shock: rear_shock}
  end

  def default_tire_size
    '2.1'
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    {flag: flag}
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

starting  = Date.parse("2015/09/04")
ending    = Date.parse("2015/09/10")

b = Bicycle.new
p b.inspect
p b.schedulable?(starting, ending)

v = Vehicle.new
p v.schedulable?(starting, ending)

m = Mechanic.new
p m.schedulable?(starting, ending)

# bent = RecumbentBike.new(flag: 'tall and orange')
#
# p bent.spares
#
# road_bike = RoadBike.new(
#   size: 'M',
#   tape_color: 'red'
# )
#
# p road_bike.tire_size
# p road_bike.chain
# p road_bike.inspect
#
# mountain_bike = MountainBike.new(
#   size: 'S',
#   front_shock: 'Manitou',
#   rear_shock: 'Fox'
# )
#
# p mountain_bike.tire_size
# p mountain_bike.chain
# p mountain_bike.rear_shock
# p mountain_bike.inspect
