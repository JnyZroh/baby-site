require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get guests_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post guests_url, params: { guest: { address: @guest.address, attending: @guest.attending, birth_alert: @guest.birth_alert, city_state: @guest.city_state, first_name: @guest.first_name, last_name: @guest.last_name, phone_number: @guest.phone_number, reminders: @guest.reminders, see_photos: @guest.see_photos, zipcode: @guest.zipcode } }
    end

    assert_redirected_to guest_url(Guest.last)
  end

  test "should show guest" do
    get guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    patch guest_url(@guest), params: { guest: { address: @guest.address, attending: @guest.attending, birth_alert: @guest.birth_alert, city_state: @guest.city_state, first_name: @guest.first_name, last_name: @guest.last_name, phone_number: @guest.phone_number, reminders: @guest.reminders, see_photos: @guest.see_photos, zipcode: @guest.zipcode } }
    assert_redirected_to guest_url(@guest)
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete guest_url(@guest)
    end

    assert_redirected_to guests_url
  end
end
