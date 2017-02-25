class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  def init
    self.balance  ||= 0.0           #will set the default value only if it's nil
    self.status ||= 'pending'
  end
end
