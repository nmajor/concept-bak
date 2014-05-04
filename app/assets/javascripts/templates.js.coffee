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
      $(".template-image").html('<image src="'+data.result.image_url+'" alt="'+data.result.image+'">')
      message "success", "Image Saved"
      return
  return

root.template_update = ->
  $('.rm-rtb').click ->
    info = $(this).prop('id').split(':');
    delete_rtb info
    return
  $(".add-rtb").click ->
    $(this).prev().append "<li><div class=\"rtb-text new-rtb-text\" contenteditable=\"\" id=\"rtb:" + new Date().getTime() + ":text\">Replace this text</div></li>"
    return
  $(document).keypress (event) ->
    if event.which is 115 and (event.ctrlKey or event.metaKey) or (event.which is 19)
      event.preventDefault()
      $(".template-save").click()
      return false
    true

  $('.template-save').click ->
    data =
      template:
        name_attributes:
          text: $('.template-name').text()
        desc_attributes:
          text: $('.template-desc').text()
        body_attributes:
          text: $('.template-text').text()

    data.rtbgroups = []
    console.log(data)
    $('.rtbgroups > div').each ->
      group_text = $(this).children('h6').text();
      group_info = $(this).children('h6').prop('id').split(':');

      rtbs = []
      $(this).children('.rtbs').children('li').children('div').each ->
        rtb_text = $(this).text();
        rtb_info = $(this).prop("id").split(':');
        rtbs.push( {"id":rtb_info[1],"text":rtb_text} );
        return

      data.rtbgroups.push( {"id":group_info[1],"text":group_text,"rtbs":rtbs} );
      return

    $.ajax
      data: data
      type: $('#template_method').val()
      url: $('#template_path').val()
      error: (data) ->
        message "error", "Save Failed"
      success: (data) ->
        message "success", "Saved"
        console.log(data)

        new_rtbgroups = ''
        for rtbgroup in data.rtbgroups
          new_rtbgroups += '<div class="rtbgroup">'
          new_rtbgroups += '<h6 class="rtbgroup-text" contenteditable="" id="rtbgroup:'+rtbgroup.id+':text">'+rtbgroup.text+'</h6>'
          new_rtbgroups += '<ul class="rtbs">'
          for rtb in rtbgroup.rtbs
            new_rtbgroups += '<li><span class="rm-rtb delete-link" id="rtb:'+rtb.id+':delete"><i class="fa fa-minus-circle"></i> </span><div class="rtb-text" contenteditable="" id="rtb:'+rtb.id+':text"> '+rtb.text+'</div></li>'
          new_rtbgroups += '</ul>'
          new_rtbgroups += '<div class="add-rtb add-link"><i class="fa fa-plus-circle"></i> Add Reason</div>'
          new_rtbgroups += '</div>'
        $('.rtbgroups').html(new_rtbgroups)
        $('.template-name').html(data.name_text)
        $('.template-desc').html(data.desc_text)
        $('.template-text').html(data.body_text)

        $('.rm-rtb').click ->
          info = $(this).prop('id').split(':');
          delete_rtb info
          return
        $(".add-rtb").click ->
          $(this).prev().append "<li><div class=\"rtb-text new-rtb-text\" contenteditable=\"\" id=\"rtb:" + new Date().getTime() + ":text\">Replace this text</div></li>"
          return
    return

  message = (cl, mes) ->
      $('#template-message').removeClass().addClass('template-'+cl).html(mes).show()
      setTimeout ( ->
        $('#template-message').hide()
      ),3000

  delete_rtb = (info) ->
    $.ajax
      type: 'DELETE'
      url: '/rtbs/'+info[1]+'.json'
      error: (data) ->
        message "error", "Delete Failed"
      success: (data) ->
        message "success", "Deleted"
        $('#rtb\\:'+info[1]+'\\:text').parent().remove()
    return

  return