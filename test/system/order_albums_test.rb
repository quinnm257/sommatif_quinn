require "application_system_test_case"

class OrderAlbumsTest < ApplicationSystemTestCase
  setup do
    @order_album = order_albums(:one)
  end

  test "visiting the index" do
    visit order_albums_url
    assert_selector "h1", text: "Order albums"
  end

  test "should create order album" do
    visit order_albums_url
    click_on "New order album"

    fill_in "Album copy", with: @order_album.album_copy_id
    fill_in "Order", with: @order_album.order_id
    click_on "Create Order album"

    assert_text "Order album was successfully created"
    click_on "Back"
  end

  test "should update Order album" do
    visit order_album_url(@order_album)
    click_on "Edit this order album", match: :first

    fill_in "Album copy", with: @order_album.album_copy_id
    fill_in "Order", with: @order_album.order_id
    click_on "Update Order album"

    assert_text "Order album was successfully updated"
    click_on "Back"
  end

  test "should destroy Order album" do
    visit order_album_url(@order_album)
    click_on "Destroy this order album", match: :first

    assert_text "Order album was successfully destroyed"
  end
end
