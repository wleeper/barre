RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

RSpec.shared_context 'with valid user' do
	let(:user) { User.make! }
	before do
		sign_in :user, user
	end
end


