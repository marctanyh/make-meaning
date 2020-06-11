require "application_system_test_case"

class OppourtunitiesTest < ApplicationSystemTestCase
  setup do
    @oppourtunity = oppourtunities(:one)
  end

  test "visiting the index" do
    visit oppourtunities_url
    assert_selector "h1", text: "Oppourtunities"
  end

  test "creating a Oppourtunity" do
    visit oppourtunities_url
    click_on "New Oppourtunity"

    fill_in "Name", with: @oppourtunity.name
    click_on "Create Oppourtunity"

    assert_text "Oppourtunity was successfully created"
    click_on "Back"
  end

  test "updating a Oppourtunity" do
    visit oppourtunities_url
    click_on "Edit", match: :first

    fill_in "Name", with: @oppourtunity.name
    click_on "Update Oppourtunity"

    assert_text "Oppourtunity was successfully updated"
    click_on "Back"
  end

  test "destroying a Oppourtunity" do
    visit oppourtunities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oppourtunity was successfully destroyed"
  end
end
