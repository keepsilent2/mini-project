require_relative "simulator"
require_relative "graph"

sim = WeatherSimulator.new(7)
data = sim.generate

puts "\nTEMP:"
Graph.line(data, :temp)

puts "\nHUMIDITY:"
Graph.line(data, :humidity)
