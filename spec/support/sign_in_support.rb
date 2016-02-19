require 'rspec/core/shared_context'

module FactoryModels
  extend RSpec::Core::SharedContext

  let(:user) { FactoryGirl.create :user }
end

module LoggedInAsUser
  extend RSpec::Core::SharedContext
  include Devise::TestHelpers
  include FactoryModels

  before do
    sign_in user
    user_signed_in=true
  end
end





# module ValidUserHelper
#   def signed_in_as_a_valid_user
#     let(:user) { FactoryGirl.create :user }
#     sign_in user # method from devise:TestHelpers
#   end
# end
#
# # module for helping request specs
# module ValidUserRequestHelper
#
#   # for use in request specs
#   def sign_in_as_a_valid_user
#     let(:user) { FactoryGirl.create :user }
#     post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
#   end
# end
#
# RSpec.configure do |config|
#   config.include ValidUserHelper, :type => :controller
#   config.include ValidUserRequestHelper, :type => :request
# end
