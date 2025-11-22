require "json"
require "fileutils"

class Organizer
  def initialize(folder)
    @folder = folder
    @rules = JSON.parse(File.read("rules.json"))
  end

  def organize
    Dir.glob("#{@folder}/*").each do |file|
      next if File.directory?(file)

      ext = file.split(".").last.downcase

      @rules.each do |folder, exts|
        if exts.include?(ext)
          FileUtils.mkdir_p("#{@folder}/#{folder}")
          FileUtils.mv(file, "#{@folder}/#{folder}/")
        end
      end
    end
  end
end

