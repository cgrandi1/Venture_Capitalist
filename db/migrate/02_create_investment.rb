class CreateInvestmentTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :investments do |t|
            t.string :company_name
            t.integer :amount_invested
            t.integer :years_until_return
            t.integeer :investor_id

            t.timestamps null:false
        end 
    end
end 