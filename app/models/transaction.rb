class Transaction < ActiveRecord::Base
  belongs_to :trans_from, class_name: "User"
  belongs_to :trans_to, class_name: "User"
  belongs_to :from_account, class_name: "Account"
  belongs_to :to_account, class_name: "Account"

end
