class CreateInvestorTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :investors do |t|
            t.string :username
            t.string :email
            t.string :password_digest

            t.timestamps null:false
        end 
    end
end 