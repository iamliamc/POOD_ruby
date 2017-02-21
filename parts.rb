require 'forwardable'

class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end
end


class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args={})
    @name         = args[:name]
    @description  = args[:description]
    @needs_spare  = args.fetch(:needs_spare, true)
  end
end

# class RoadBikeParts < Parts
#   attr_reader :tape_color
#
#   def post_initialize(args)
#     @tape_color = args[:tape_color]
#   end
#
#   def local_spares
#     {tape_color: tape_color}
#   end
#
#   def default_tire_size
#     '23'
#   end
# end
#
# class MountainBikeParts < Parts
#   attr_reader :front_shock, :rear_shock
#
#   def post_initialize(args)
#     @front_shock = args[:front_shock]
#     @rear_shock = args[:rear_shock]
#   end
#
#   def local_spares
#     {rear_shock: rear_shock}
#   end
#
#   def default_tire_size
#     '2.1'
#   end
# end
