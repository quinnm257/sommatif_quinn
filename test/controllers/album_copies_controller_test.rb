require "test_helper"

class AlbumCopiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_copy = album_copies(:one)
  end

  test "should get index" do
    get album_copies_url
    assert_response :success
  end

  test "should get new" do
    get new_album_copy_url
    assert_response :success
  end

  test "should create album_copy" do
    assert_difference("AlbumCopy.count") do
      post album_copies_url, params: { album_copy: { album_id: @album_copy.album_id, condition: @album_copy.condition, media_type: @album_copy.media_type, price: @album_copy.price } }
    end

    assert_redirected_to album_copy_url(AlbumCopy.last)
  end

  test "should show album_copy" do
    get album_copy_url(@album_copy)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_copy_url(@album_copy)
    assert_response :success
  end

  test "should update album_copy" do
    patch album_copy_url(@album_copy), params: { album_copy: { album_id: @album_copy.album_id, condition: @album_copy.condition, media_type: @album_copy.media_type, price: @album_copy.price } }
    assert_redirected_to album_copy_url(@album_copy)
  end

  test "should destroy album_copy" do
    assert_difference("AlbumCopy.count", -1) do
      delete album_copy_url(@album_copy)
    end

    assert_redirected_to album_copies_url
  end
end
