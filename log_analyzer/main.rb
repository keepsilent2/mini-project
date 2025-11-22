require_relative "parser"
require_relative "report"

parser = LogParser.new("logs.txt")
logs = parser.parse

puts "\n=== SUMMARY ==="
Report.display(Report.summary(logs))

