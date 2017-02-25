class CreateAccountreqs < ActiveRecord::Migration
  def change
    create_table :accountreqs do |t|

      t.timestamps null: false
    end
  end
end
