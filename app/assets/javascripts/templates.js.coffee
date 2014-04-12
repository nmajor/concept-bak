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
      $('.template-message').addClass('template-success').html('Image Saved').show()
      setTimeout ( ->
        $('.template-message').hide()
      ),3000
      return
  return

root.template_update = ->
  $('.rm-rtb').click ->
    info = $(this).prop('id').split(':');
    $.ajax
      type: 'DELETE'
      url: '/rtbs/'+info[1]+'.json'
      error: (data) ->
        message "error", "Delete Failed"
      success: (data) ->
        message "success", "Deleted"
        $('#rtb\\:'+info[1]+'\\:text').parent().remove()
    return

  $('.template-save').click ->
    data =
      template:
        name_attributes:
          text: $('.template-name').html()
        desc_attributes:
          text: $('.template-desc').html()
        body_attributes:
          text: $('.template-text').html()

    data.rtbgroups = []
    $('.rtbgroups > div').each ->
      group_name = $(this).children('h6').html();
      group_info = $(this).children('h6').prop('id').split(':');

      rtbs = []
      $(this).children('.rtbs').children('li').children('div').each ->
        rtb_text = $(this).html();
        rtb_info = $(this).prop("id").split(':');
        rtbs.push( {"id":rtb_info[1],"text":rtb_text} );
        return

      data.rtbgroups.push( {"id":group_info[1],"name":group_name,"rtbs":rtbs} );
      return

    $.ajax
      data: data
      type: $('#template_method').val()
      url: $('#template_path').val()
      error: (data) ->
        message "error", "Save Failed"
      success: (data) ->
        message "success", "Saved"

        new_rtbgroups = ''
        for rtbgroup in data.rtbgroups
          new_rtbgroups += '<div class="rtbgroup">'
          new_rtbgroups += '<h6 class="rtbgroup-name" contenteditable="" id="rtbgroup:'+rtbgroup.id+':name">'+rtbgroup.name+'</h6>'
          new_rtbgroups += '<ul class="rtbs">'
          for rtb in rtbgroup.rtbs
            new_rtbgroups += '<li><span class="rm-rtb" id="rtb:'+rtb.id+':delete"><i class="fa fa-minus-circle"></i> </span><div class="rtb-text" contenteditable="" id="rtb:'+rtb.id+':text"> '+rtb.text+'</div></li>'
          new_rtbgroups += '</ul>'
          new_rtbgroups += '<div class="add-rtb"><i class="fa fa-plus-circle"></i> Add Reason</div>'
          new_rtbgroups += '</div>'
        $('.rtbgroups').html(new_rtbgroups)
    return

  message = (cl, mes) ->
      $('.template-message').removeClass().addClass('template-'+cl).html(mes).show()
      setTimeout ( ->
        $('.template-message').hide()
      ),3000
    return

  return