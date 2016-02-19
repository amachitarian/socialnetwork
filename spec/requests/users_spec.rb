require 'rails_helper'

describe "GET /index" do
  it "test access to index, works with a signed in user" do
    LoggedInAsUser
    get users_path
    expect(response).to have_http_status(302)
  end
end

# describe "GET /things" do
#   it "test access to things, does not work without a signed in user" do
#     get things_path
#     response.status.should be(302) # redirect to sign in page
#   end
# end
