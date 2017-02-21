require 'date'
require './schedule'
require './parts'

class Bicycle
  include Schedulable
  attr_reader :size, :parts, :schedule

  def initialize(args={})
    @size       = args[:size]
    @parts      = args[:parts]
    @schedule   = args[:schedule]   || Schedule.new

    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def lead_days
    1
  end

  def spares
    parts.spares
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

  # def post_initialize(args)
  #   @tape_color = args[:tape_color]
  # end
  #
  # def local_spares
  #   {tape_color: tape_color}
  # end
  #
  # def default_tire_size
  #   '23'
  # end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  # def post_initialize(args)
  #   @front_shock = args[:front_shock]
  #   @rear_shock = args[:rear_shock]
  # end
  #
  # def local_spares
  #   {rear_shock: rear_shock}
  # end
  #
  # def default_tire_size
  #   '2.1'
  # end
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

chain           = Part.new(name: 'chain', description: '10-speed')
road_tire       = Part.new(name: 'tire_size', description: '23')
tape            = Part.new(name: 'tape_color', description: 'red')
mountain_tire   = Part.new(name: 'tire_size', description: '2.1')
rear_shock      = Part.new(name: 'rear_shock', description: 'Fox')
front_shock     = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)

road_bike_parts = Parts.new([chain, road_tire, tape])

road_bike = Bicycle.new(size: 'L', parts: road_bike_parts)
p road_bike.size

p road_bike.spares

mountain_bike_parts = Parts.new([chain, mountain_tire, front_shock, rear_shock])

mountain_bike = Bicycle.new(size: 'M', parts: mountain_bike_parts)
p mountain_bike.size

p mountain_bike.parts.size
p mountain_bike.spares.size


# road_bike = Bicycle.new(size: 'L', parts: RoadBikeParts.new(tape_color: 'red'))
# p road_bike.size
# p road_bike.spares
#
# mountain_bike = Bicycle.new(size: 'M', parts: MountainBikeParts.new(rear_shock: 'Fox'))
# p mountain_bike.size
# p mountain_bike.spares

# starting  = Date.parse("2015/09/04")
# ending    = Date.parse("2015/09/10")
#
# b = Bicycle.new
# p b.inspect
# p b.schedulable?(starting, ending)
#
# v = Vehicle.new
# p v.schedulable?(starting, ending)
#
# m = Mechanic.new
# p m.schedulable?(starting, ending)

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
