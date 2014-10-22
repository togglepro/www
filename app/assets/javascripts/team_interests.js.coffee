add_error_class_to_wrapper = (element) ->
  element.closest("div.input").addClass("field_with_errors")

$ ->
  # validate form
  $(document).on "submit", "form.new_team_interest", (event) ->
    error_count = 0

    # validate name
    input = $(this).find("input#team_interest_name")
    if input.val().length == 0
      add_error_class_to_wrapper(input)
      input.attr("placeholder", "Name is required.")
      error_count += 1

    # validate email
    input = $(this).find("input#team_interest_email")
    if input.val().length == 0
      add_error_class_to_wrapper(input)
      input.attr("placeholder", "Email is required.")
      error_count += 1
    else if not /\S+@\S+/.test(input.val())
      add_error_class_to_wrapper(input)
      input.attr("placeholder", "Email address \"#{input.val()}\" did not look valid.")
      input.val("")
      error_count += 1

    # validate content
    input = $(this).find("textarea#team_interest_content")
    if input.val().length == 0
      add_error_class_to_wrapper(input)
      input.attr("placeholder", "Please tell us about yourself.")
      error_count += 1

    event.preventDefault() if error_count > 0
