FactoryGirl.define do
	factory :user do
		name	"Bucky Badger"
		email	"bucky@example.com"
		password	"buckyB"
		password_confirmation "buckyB"
	end
end
