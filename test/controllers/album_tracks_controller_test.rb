require "test_helper"

class AlbumTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_track = album_tracks(:one)
  end

  test "should get index" do
    get album_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_album_track_url
    assert_response :success
  end

  test "should create album_track" do
    assert_difference("AlbumTrack.count") do
      post album_tracks_url, params: { album_track: { album_id: @album_track.album_id, track_name: @album_track.track_name, track_number: @album_track.track_number } }
    end

    assert_redirected_to album_track_url(AlbumTrack.last)
  end

  test "should show album_track" do
    get album_track_url(@album_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_track_url(@album_track)
    assert_response :success
  end

  test "should update album_track" do
    patch album_track_url(@album_track), params: { album_track: { album_id: @album_track.album_id, track_name: @album_track.track_name, track_number: @album_track.track_number } }
    assert_redirected_to album_track_url(@album_track)
  end

  test "should destroy album_track" do
    assert_difference("AlbumTrack.count", -1) do
      delete album_track_url(@album_track)
    end

    assert_redirected_to album_tracks_url
  end
end
