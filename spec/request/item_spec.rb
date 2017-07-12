require "rails_helper"

RSpec.describe "Items End Point", :type => :request do
  #  item = FactoryGirl.create(:item)
  it "Get Items" do
    get "/api/v1/items"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it "Get Items by id" do
    get "/api/v1/items/1"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it "Get Items by name" do
    get "/api/v1/items/findByName"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it "Create new item" do
    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
    }

    post "/api/v1/items",
          :params => { :item =>
                        { :name => "Foobar Item",
                          :description => "Test description"}
                      },
          :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it "Update an item" do
    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
    }

    put "/api/v1/items/1",
          :params => { :item =>
                        { :name => "Foobar Item",
                          :description => "Test description"}
                      },
          :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  it "Destroy an item" do
    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
    }

    delete "/api/v1/items/1"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

end
