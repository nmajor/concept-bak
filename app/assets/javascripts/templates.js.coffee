# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.template_update_image = ->
  $(".template-image").click ->
    $(".template-image").next().click()
    return

  $("#template_image").fileupload
    type: "PUT"
    url: "/templates/" + $("#template_id").val() + ".json"
    dataType: "json"
    add: (e, data) ->
      data.submit()
      return

    done: (e, data) ->
      console.log data
      console.log data.result.image_url
      $(".template-image").prop("src", data.result.image_url).prop "alt", data.result.image
      return
  return

root.template_update = ->
  $('.template-save').click ->
    $.ajax
      data:
        template:
          name: $('.template-name').html()
          desc: $('.template-desc').html()
          text: $('.template-text').html()
      type: $('#template_method').val()
      url: $('#template_path').val()
      error: (data) ->
        console.log('error')
        console.log(data)
      success: (data) ->
        console.log('success')
        console.log(data)
        $('.template-message').addClass('template-success').html('Saved').show()
        setTimeout ( ->
          $('.template-message').hide()
        ),3000
    return
  return