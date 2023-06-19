class Driver < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }


  def self.create_new_one(name, email, password)
    new(
      name: name,
      email: email.downcase,
      password: password
    )
  end

  def self.handle_login(email,password)
    driver = find_by(email: email.downcase)
    unless driver.present?
      raise "Invalid credentials"
    end

    unless driver.authenticate(password).present?
      raise "Invalid credentials"
    end

    # generate token
    token = '123456789'
  end
end
