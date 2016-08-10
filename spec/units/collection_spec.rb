require "spec_helper"

describe PresenterObject::Collection do
  let(:users) { [PresentableUser.new, PresentableUser.new] }
  let(:view_context) { double "view_context", render: "hello" }
  let(:user_collection) { UserCollection.new users, view_context }

  context "#each" do
    it "passes each presented object to the block" do
      user_collection.each do |user|
        expect(user).to be_a PresentableUserPresenter
        expect(user.presenter_method).to eq "called presenter method"
      end
    end
  end

  context "Delegation" do
    it "responds to presenter methods" do
      expect(user_collection.collection_presenter_method).to eq "called collection presenter method"
    end

    it "delegates to the collection" do
      expect(users).to receive(:size).and_return 2
      user_collection.size
    end

    it "delegates to the view context" do
      expect(view_context).to receive(:render).and_return "hello"
      user_collection.render
    end

    it "raises an error when method doesn't exist" do
      expect { user_collection.unknown_method }.to raise_error NoMethodError
    end
  end
end
