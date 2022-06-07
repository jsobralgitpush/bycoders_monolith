require 'rails_helper'

RSpec.describe Transaction, :type => :model do
    it "is not valid without a Store Name" do
        transaction = Transaction.new(store_name: nil)
        expect(transaction).to_not be_valid
    end

    it "is not valid without a Transaction Type" do
        transaction = Transaction.new(transaction_type: nil)
        expect(transaction).to_not be_valid
    end

    it "is not valid without a Taxpayer Id" do
        transaction = Transaction.new(taxpayer_id: nil)
        expect(transaction).to_not be_valid
    end

    it "is not valid without an Amount" do
        transaction = Transaction.new(amount: nil)
        expect(transaction).to_not be_valid
    end

    it "is valid with valid attributes" do
        transaction = Transaction.new(
            store_name: "Store Name",
            transaction_type: "Transaction Type",
            taxpayer_id: "Taxpayer Id",
            amount: 123,
            date: "Date",
            card_used: "Card Used",
            time: "Time",
            store_owner: "Store Owner"
        )

        expect(transaction).to be_valid
    end

end