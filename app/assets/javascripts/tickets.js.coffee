$(document).on 'ajax:success', '#div-modal', (xhr, data, status) ->
  console.log "success captured"  
  location.reload()
  
$(document).on 'ajax:error', '#div-modal', (xhr, data, status) ->
  console.log "ajax:error captured"

  form = $('#new_ticket .modal-body')
  div = $('<div id="createTicketErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  json = JSON.parse data.responseText
  console.log json
  json.messages.forEach (message, i) ->
    li = $('<li></li>').text(message)
    ul.append(li)
    if $('#createTicketErrors')[0]
      $('#createTicketErrors').html(ul)
    else
      div.append(ul)
      form.prepend(div)
