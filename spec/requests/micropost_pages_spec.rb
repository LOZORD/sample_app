require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end # create


 """ describe 'count microposts' do
    #puts 'edit micro pages spec'
    # before fact girl create one post
    describe 'singular' do

      before do
        visit root_path
        FactoryGirl.create(:micropost)
      end
      after { Micropost.delete_all }
      it { should have_content('1 micropost') }
    end
    describe 'multiple' do
      before(:all) { 5.times { FactoryGirl.create(:micropost) } } 
        #visit root_path
      after(:all) { Micropost.delete_all }
      it { should have_content('5 microposts') }
    end
  end


  describe 'pagination' do
    before(:all) do 
      visit root_path
      { 50.times { FactoryGirl.create(:micropost) } }
    end
    after(:all) { Micropost.delete_all }

      it { should have_selector('div.pagination') } 

      it 'should list each micropost' do
        Micropost.paginate(page: 1).each do |mpost|
          expect(mpost).to have_selector('li')
        #end
      end
    end
  end # pagination

  """


  describe 'micropost destruction' do
    before { FactoryGirl.create(:micropost, user: user) }

    describe 'as correct user' do
      before { visit root_path }

      it 'should delete a micropost' do
        expect { click_link 'delete' }.to change(Micropost, :count).by(-1)
      end
    end # correct user

    describe 'as other user' do
      it 'should not have a delete link' do
      end
    end # as other user
  end # destroy
end
