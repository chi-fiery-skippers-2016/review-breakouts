class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @password = Password.create(plaintext_password)
    self.hashed_password = @password
  end

  def authenticate(user_password)
    self.password == user_password
  end

end