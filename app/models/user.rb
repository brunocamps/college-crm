class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  include Roleable


  #important method 
  after_create do
    # assign default role
    self.update(student: true)

  end

  def to_s
    email
  end
end
