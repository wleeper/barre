require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end
password = Faker::Internet.password

User.blueprint do
	last_name { Faker::Name.last_name }
	first_name { Faker::Name.first_name }
	email { Faker::Internet.email }
	password { password }
	password_confirmation { password }
end

Post.blueprint do
  # Attributes here
end
