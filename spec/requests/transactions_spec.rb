require "rails_helper"

RSpec.describe "Transactions Requests", :type => :request do
    it "should return all transactions" do
        get '/transactions'
        expect(response).to have_http_status(200)
        expect(assigns(:transactions)).to eq(Transaction.all)
    end

    it "should return all transactions for a specific Store Name" do
        get '/transactions?store_name=MERCADO%20DA%20AVENIDA'
        expect(response).to have_http_status(200)
        expect(assigns(:transactions)).to eq(Transaction.ransack(store_name_cont: controller.params[:store_name]).result)
    end

    it "should create new transactions" do
        expect {
            post '/transactions', params: {
                file: Rack::Test::UploadedFile.new(Rails.root.join('public', 'cnab.txt'), 'text/plain')
            }
        }.to change{Transaction.count}.by(21)
    end

    
end
