class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable

  has_many :work_orders, dependent: :destroy
  has_many :projects, through: :work_orders
  has_many :timesheets, dependent: :destroy
  belongs_to :company

  def name
    email.split("@").first.capitalize
  end
end
