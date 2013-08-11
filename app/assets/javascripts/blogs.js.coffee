($ document).ready ->
  $input = ($ '#blog_content')
  return unless $input.length > 0

  request_pending = false
  update_preview = ->
    request_pending = false
    markdown = $input.val().trim()
    if markdown.length > 0
      $.post '/blogs/preview', {text: markdown}

  $input.keyup ->
    unless request_pending
      request_pending = true
      setTimeout update_preview, 500
