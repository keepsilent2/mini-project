require 'kramdown'

class Compiler
    TEMPLATE_PATH = "templates/base.html"
    OUTPUT_DIR = "output"

    def initialize
        FileUtils.mkdir_p(OUTPUT_DIR)
        @template = File.read(TEMPLATE_PATH)
    end

    def compile_file(file_path)
        md = File.read(file_path)
        html = Kramdown::Document.new(md).to_html

        title = File.basename(file_path, ".md").capitalize
        final_html = @template.gsub("{{TITLE}}", title)
                              .gsub("{{CONTENT}}", html)

        out_file = "#{OUTPUT_DIR}/#{title.downcase}.html"
        File.write(out_file, final_html)

        puts "Compiled: #{out_file}"
    end

    def compile_all
        Dir.glob("notes/*.md").each do |file|
            compile_file(file)
        end
    end
end

