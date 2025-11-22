require "yaml"

class Bot
  def initialize
    @intents = YAML.load_file("intents.yml")
  end

  def respond(text)
    text = text.downcase

    @intents.each do |key, data|
      data["patterns"].each do |p|
        return data["responses"].sample if text.include?(p)
      end
    end

    "I don't understand."
  end
end

