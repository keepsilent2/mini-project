require_relative "compiler"

template = File.read("template.html")
compiler = MarkdownCompiler.new(template)

Dir.mkdir("output") unless Dir.exist?("output")

Dir.glob("notes/*.md").each do |file|
  md = File.read(file)
  compiled = compiler.compile(md)

  title = md.lines.first.gsub("#", "").strip
  html = compiler.build_page(title, compiled)

  out_name = file.split("/").last.gsub(".md", ".html")
  File.write("output/#{out_name}", html)
end

puts "Compiled successfully!"
