require "application_system_test_case"

class GearsTest < ApplicationSystemTestCase
  setup do
    @gear = gears(:one)
  end

  test "visiting the index" do
    visit gears_url
    assert_selector "h1", text: "Gears"
  end

  test "should create gear" do
    visit gears_url
    click_on "New gear"

    fill_in "Description", with: @gear.description
    fill_in "Item", with: @gear.item
    fill_in "Price", with: @gear.price
    click_on "Create Gear"

    assert_text "Gear was successfully created"
    click_on "Back"
  end

  test "should update Gear" do
    visit gear_url(@gear)
    click_on "Edit this gear", match: :first

    fill_in "Description", with: @gear.description
    fill_in "Item", with: @gear.item
    fill_in "Price", with: @gear.price
    click_on "Update Gear"

    assert_text "Gear was successfully updated"
    click_on "Back"
  end

  test "should destroy Gear" do
    visit gear_url(@gear)
    click_on "Destroy this gear", match: :first

    assert_text "Gear was successfully destroyed"
  end
end
