class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        @store_names  = @transactions.pluck(:store_name).uniq

        filter_by_query if params[:store_name].present?
    end

    def create
        file_data = File.open(params.values[0]).readlines.map(&:chomp)
        
        file_data.each do |line|
            transaction = Transaction.new

            transaction.transaction_type = line[0]
            transaction.date =  line[1, 8]
            if [1,4,5,6,7,8].include? line[0].to_i 
                transaction.amount = line[9, 10]
            else
                transaction.amount = -(line[9, 10].to_f)
            end
            transaction.taxpayer_id = line[19, 11]
            transaction.card_used =  line[30, 12]
            transaction.time =  line[42, 6]
            transaction.store_owner =  line[48, 14]
            transaction.store_name = line[62, 19]

            transaction.save
        end

        redirect_back(fallback_location: root_path)
    end

    private
    def filter_by_query
        @transactions = @transactions.ransack(
            store_name_cont: params[:store_name]
        ).result
    end
end
