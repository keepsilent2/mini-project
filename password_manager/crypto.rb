require 'openssl'
require 'base64'

class Crypto
  def self.encrypt(text, key)
    cipher = OpenSSL::Cipher.new("AES-256-CBC")
    cipher.encrypt
    cipher.key = Digest::SHA256.digest(key)
    iv = cipher.random_iv
    encrypted = cipher.update(text) + cipher.final
    Base64.strict_encode64(iv + encrypted)
  end

  def self.decrypt(encoded_text, key)
    data = Base64.decode64(encoded_text)
    cipher = OpenSSL::Cipher.new("AES-256-CBC")
    cipher.decrypt
    cipher.key = Digest::SHA256.digest(key)
    cipher.iv = data[0..15]
    cipher.update(data[16..]) + cipher.final
  end
end

