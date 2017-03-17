require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do

    it "is invalid without a name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without a description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid with a description longer than 500 characters" do
      event = Event.new(description:"a"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid without a price" do
     event = Event.new(price: 9)
     event.valid?
     expect(event.errors).not_to have_key(:price)
    end
  end

   describe "#bargain?" do
    let(:bargain_event) { create :event, price: 28 }
    let(:non_bargain_event) { create :event, price: 35 }

      it "returns true if the price is smaller than 30 EUR" do
        expect(bargain_event.bargain?).to eq(true)
        expect(non_bargain_event.bargain?).to eq(false)
      end
    end

  describe "#free?" do
    let(:free_event) { create :event, price: 0 }
    let(:non_free_event) {create :event, price: 10 }

    it "returns true if the price is zero" do
      expect(free_event.free?).to eq(true)
      expect(non_free_event.free?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let(:event1) { create :event, price: 0 }
    let(:event2) {create :event, price: 10}
    let(:event3) {create :event, price: 50}

    it "returns sorted events based on price" do
      expect(Event.order_by_price).to eq([event1, event2, event3])
    end
  end

  describe "association with user" do
  let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.new(name: "")

      expect(event.user).to eq(user)
    end
  end

  describe "categories association" do
  let(:event) { create :event }

  let(:category1) { create :category, name: "Beer and friends", events: [event] }
  let(:category2) { create :category, name: "Birthday", events: [event] }
  let(:category3) { create :category, name: "Sports and drinks", events: [event] }

    it "habtm categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

  describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end
end
