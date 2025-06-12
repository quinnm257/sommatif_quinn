require "application_system_test_case"

class AlbumCopiesTest < ApplicationSystemTestCase
  setup do
    @album_copy = album_copies(:one)
  end

  test "visiting the index" do
    visit album_copies_url
    assert_selector "h1", text: "Album copies"
  end

  test "should create album copy" do
    visit album_copies_url
    click_on "New album copy"

    fill_in "Album", with: @album_copy.album_id
    fill_in "Condition", with: @album_copy.condition
    fill_in "Media type", with: @album_copy.media_type
    fill_in "Price", with: @album_copy.price
    click_on "Create Album copy"

    assert_text "Album copy was successfully created"
    click_on "Back"
  end

  test "should update Album copy" do
    visit album_copy_url(@album_copy)
    click_on "Edit this album copy", match: :first

    fill_in "Album", with: @album_copy.album_id
    fill_in "Condition", with: @album_copy.condition
    fill_in "Media type", with: @album_copy.media_type
    fill_in "Price", with: @album_copy.price
    click_on "Update Album copy"

    assert_text "Album copy was successfully updated"
    click_on "Back"
  end

  test "should destroy Album copy" do
    visit album_copy_url(@album_copy)
    click_on "Destroy this album copy", match: :first

    assert_text "Album copy was successfully destroyed"
  end
end
