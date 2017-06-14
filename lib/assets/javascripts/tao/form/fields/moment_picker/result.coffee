#= require tao/form/shared/fields/moment_picker/result/base

class Tao.Form.MomentPicker.Result extends Tao.Form.MomentPicker.ResultBase

  @attribute 'active', type: 'boolean'

  _connected: ->
    super
    @jq.attr('tabindex', '0') unless @disabled

  _bind: ->
    super

    @on 'click', '.link-clear', (e) =>
      return if @disabled
      @clear() && @trigger('tao:clear')
      false

  _disabledChanged: ->
    if @disabled
      @jq.removeAttr 'tabindex'
    else
      @jq.attr 'tabindex', '0'

TaoComponent.register Tao.Form.MomentPicker.Result
