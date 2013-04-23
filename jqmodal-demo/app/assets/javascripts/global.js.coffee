$ ->
  ## jqmDialog 扩展方法
  # 初始化页面中的对话框
  $('.jqmWindow').jqm
    toTop: true
    modal: true
    onHide: (modal) ->
      modal.w.fadeOut () ->
        # 如果弹出窗口内容是ajax读取，则在隐藏时将内容重置为载入动画
        $preloader = modal.w.find('.preloader')
        modal.w.jqmUpdate($preloader.html()) if $preloader.length
        
        # 清除Overlay
        modal.o.remove() if modal.o

  # 绑定了 data-toggle=jqmModel 的元素，会自动寻找 data-target 或者 href 对应的弹出层并打开
  $(document).on 'click', '[data-toggle=jqmModal]', (e) ->
    $this = $(@)
    href= $this.attr('href')
    $target = $($this.attr('data-target') or (href && href.replace(/.*(?=#[^\s]+$)/, '')))
    $target.jqmShow()
    e.preventDefault()
