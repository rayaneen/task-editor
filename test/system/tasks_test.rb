require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = Task.ordered.first
  end

  test "Showing a task" do
    visit tasks_path
    click_link @task.name

    assert_selector "h1", text: @task.name
  end

  test "Creating a new task" do
    visit tasks_path
    assert_selector "h1", text: "Tasks"

    click_on "New task"
    fill_in "Name", with: "Capybara task"

    assert_selector "h1", text: "Tasks"
    click_on "Create task"

    assert_selector "h1", text: "Tasks"
    assert_text "Capybara task"
  end

  test "Updating a task" do
    visit tasks_path
    assert_selector "h1", text: "Tasks"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated task"

    assert_selector "h1", text: "Tasks"
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
