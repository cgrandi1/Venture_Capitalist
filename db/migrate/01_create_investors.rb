class CreateInvestorTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :investor do |t|
            t.string :name
            t.string :email_address
            t.string :password_digest
        end 
    end
end 