require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  setup do
    @guest = guests(:one)
  end

  test "visiting the index" do
    visit guests_url
    assert_selector "h1", text: "Guests"
  end

  test "creating a Guest" do
    visit guests_url
    click_on "New Guest"

    fill_in "Address", with: @guest.address
    check "Attending" if @guest.attending
    check "Birth alert" if @guest.birth_alert
    fill_in "City state", with: @guest.city_state
    fill_in "First name", with: @guest.first_name
    fill_in "Last name", with: @guest.last_name
    fill_in "Phone number", with: @guest.phone_number
    check "Reminders" if @guest.reminders
    check "See photos" if @guest.see_photos
    fill_in "Zipcode", with: @guest.zipcode
    click_on "Create Guest"

    assert_text "Guest was successfully created"
    click_on "Back"
  end

  test "updating a Guest" do
    visit guests_url
    click_on "Edit", match: :first

    fill_in "Address", with: @guest.address
    check "Attending" if @guest.attending
    check "Birth alert" if @guest.birth_alert
    fill_in "City state", with: @guest.city_state
    fill_in "First name", with: @guest.first_name
    fill_in "Last name", with: @guest.last_name
    fill_in "Phone number", with: @guest.phone_number
    check "Reminders" if @guest.reminders
    check "See photos" if @guest.see_photos
    fill_in "Zipcode", with: @guest.zipcode
    click_on "Update Guest"

    assert_text "Guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Guest" do
    visit guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guest was successfully destroyed"
  end
end
