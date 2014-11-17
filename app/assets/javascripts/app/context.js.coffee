class Emark
  @initialize: ->
    console.log "[Emark]: Emark initialize"
    window.emark = new Emark

  constructor: ->
    console.log "[Emark]: Emark app object created"
    do @handleEmptyTasks
    do @handleFilledTasks
    do @handleEmarkTask

  handleEmptyTasks: ->
    $(document).on 'click', '.tasks__next__empty-element', ->
      content = prompt 'Напишите содержание задачи'
      if content
        $.post '/tasks', content: content, (answer) =>
          if answer.success
            console.log '[Emark]: Created task'
            $(this).html content
            $(this).data('id', answer.id)
            $(this).removeClass 'tasks__next__empty-element'
            $(this).addClass 'tasks__next__filled-element'
          else
            alert 'Задача не создана, но почему?!'

  handleFilledTasks: ->
    $(document).on 'click', '.tasks__next__filled-element', ->
      id = $(this).data 'id'
      $.post '/tasks/' + id + '/inemark', {}, (answer) =>
        if answer.success
          console.log "[Emark]: Task #{id} was set in emark"
          $('.tasks__emark__element').html answer.content
          $(this).removeClass 'tasks__next__filled-element'
          $(this).addClass 'tasks__next__empty-element'
          $(this).html '+'
        else
          alert 'Ваш emark уже установлен'

  handleEmarkTask: ->


window.Emark = Emark