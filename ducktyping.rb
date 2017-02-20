#incomplete code demonstrating ducktyping - prepare_trip. This method signature is the only thing each 'preparer' has in common. 

class Trip
  attr_reader :bicycles, :customers, :vehicle

  # this 'mechanic argument could be of any class'
  def prepare(preparers)
    preparers.each {|preparer|
    preparer.prepare_trip(self) }
  end
end

class Mechanic
  def prepare_bycycles(trip)
    trip.bicycles.each {|b| prepare_bicycle(b)}
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end
