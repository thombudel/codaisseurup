require 'rails_helper'

describe "Navigating events" do
  before { login_as user }

  let(:user) { create :user }
  let!(:event) { create :event , user: user }

  it "allows navigation from the event detail page to the events page" do
    visit event_url(event)

    click_link "Back to Events"

    expect(current_path).to eq(events_path)
  end

    it "allows navigation from the events page to the event detail page" do
    visit events_url

    click_link "View Event"

    expect(current_path).to eq(event_path(event))
  end
end
