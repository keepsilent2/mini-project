require 'yaml'
require_relative 'crypto'

class Manager
  FILE = "data.yml"

  def initialize(master_key)
    @master_key = master_key
    load_data
  end

  def load_data
    if File.exist?(FILE)
      enc = YAML.load_file(FILE)
      @data = enc.map { |k, v| [k, Crypto.decrypt(v, @master_key)] }.to_h
    else
      @data = {}
    end
  rescue
    puts "Wrong master password!"
    exit
  end

  def save
    encrypted = @data.map { |k, v| [k, Crypto.encrypt(v, @master_key)] }.to_h
    File.write(FILE, encrypted.to_yaml)
  end

  def add(service, password)
    @data[service] = password
    save
  end

  def get(service)
    @data[service]
  end

  def list
    @data.keys
  end

  def delete(service)
    @data.delete(service)
    save
  end
end

