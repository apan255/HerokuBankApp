class User < ActiveRecord::Base
  has_secure_password

  has_many :accounts
  has_many :friends, :foreign_key => 'firend_id'

  has_many :transactions
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
end
