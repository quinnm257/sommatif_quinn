require "application_system_test_case"

class AlbumTracksTest < ApplicationSystemTestCase
  setup do
    @album_track = album_tracks(:one)
  end

  test "visiting the index" do
    visit album_tracks_url
    assert_selector "h1", text: "Album tracks"
  end

  test "should create album track" do
    visit album_tracks_url
    click_on "New album track"

    fill_in "Album", with: @album_track.album_id
    fill_in "Track name", with: @album_track.track_name
    fill_in "Track number", with: @album_track.track_number
    click_on "Create Album track"

    assert_text "Album track was successfully created"
    click_on "Back"
  end

  test "should update Album track" do
    visit album_track_url(@album_track)
    click_on "Edit this album track", match: :first

    fill_in "Album", with: @album_track.album_id
    fill_in "Track name", with: @album_track.track_name
    fill_in "Track number", with: @album_track.track_number
    click_on "Update Album track"

    assert_text "Album track was successfully updated"
    click_on "Back"
  end

  test "should destroy Album track" do
    visit album_track_url(@album_track)
    click_on "Destroy this album track", match: :first

    assert_text "Album track was successfully destroyed"
  end
end
