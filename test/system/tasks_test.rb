require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:first) # Reference to the first fixture task
  end

  test "Creating a new task" do
    # When we visit the Tasks#index page
    # we expect to see a title with the text "Tasks"
    visit tasks_path
    assert_selector "h1", text: "Tasks"

    # When we click on the link with the text "New task"
    # we expect to land on a page with the title "New task"
    click_on "New task"
    assert_selector "h1", text: "New task"

    # When we fill in the name input with "Capybara task"
    # and we click on "Create Task"
    fill_in "Name", with: "Capybara task"
    click_on "Create task"

    # We expect to be back on the page with the title "Tasks"
    # and to see our "Capybara task" added to the list
    assert_selector "h1", text: "Tasks"
    assert_text "Capybara task"
  end

  test "Showing a task" do
    visit tasks_path
    click_link @task.name

    assert_selector "h1", text: @task.name
  end

  test "Updating a task" do
    visit tasks_path
    assert_selector "h1", text: "Tasks"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit task"

    fill_in "Name", with: "Updated task"
    click_on "Update task"

    assert_selector "h1", text: "Tasks"
    assert_text "Updated task"
  end

  test "Destroying a task" do
    visit tasks_path
    assert_text @task.name

    click_on "Delete", match: :first
    assert_no_text @task.name
  end
end
