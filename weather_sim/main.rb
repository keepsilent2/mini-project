require_relative 'generator'
require_relative 'report'

week = WeatherGenerator.week
Report.print(week)

