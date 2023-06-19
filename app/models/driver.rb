class Driver < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }


  def self.create_new_one(data)
    new(
      name: data[:name],
      email: data[:email],
      password: data[:password]
    )
  end
end
