require "rails_helper"

describe "Contact Page" do
  it "Shows the company's contact information" do
    visit root_url
    click_on "Contact"

    expect(page).to have_content "Sarphatipark 116 1073ED Amsterdam"
  end
end
