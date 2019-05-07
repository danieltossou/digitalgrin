require "application_system_test_case"

class FieldsTest < ApplicationSystemTestCase
  setup do
    @field = fields(:one)
  end

  test "visiting the index" do
    visit fields_url
    assert_selector "h1", text: "Fields"
  end

  test "creating a Field" do
    visit fields_url
    click_on "New Field"

    fill_in "Name", with: @field.name
    click_on "Create Field"

    assert_text "Field was successfully created"
    click_on "Back"
  end

  test "updating a Field" do
    visit fields_url
    click_on "Edit", match: :first

    fill_in "Name", with: @field.name
    click_on "Update Field"

    assert_text "Field was successfully updated"
    click_on "Back"
  end

  test "destroying a Field" do
    visit fields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Field was successfully destroyed"
  end
end
