class CreateInvestorTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :investors do |t|
            t.string :first_name
            t.string :last_name
            t.string :email
            t.string :password_digest

            t.timestamps null:false
        end 
    end
end 