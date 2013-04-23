jQuery ->
  $.fn.extend
    # 自动关闭对话框 自动关闭默认时间为 2000
    # $obj.jqmAutoHide()
    # $obj.jqmAutoHide(1000)
    # $obj.jqmAutoHide(callback)
    # $obj.jqmAutoHide(1000, callback)
    jqmAutoHide: (delay, callback) ->
      $modal = @

      # 如果 delay 为数字，则使用该数字为延迟时间，否则使用系统默认时间
      timeout = if isNaN(delay) then 2000 else parseInt(delay)

      # 根据参数类型，自动选择加调方法
      handler = $.noop
      if $.isFunction(delay)
        handler = delay
      else if $.isFunction(callback)
        handler = callback
      
      setTimeout () ->
        $modal.jqmHide()
        handler()
      , timeout

    # 更新对话框内容
    jqmUpdate: (html) ->
      $modal = @
      $modal.find('.model-content').html(html)
