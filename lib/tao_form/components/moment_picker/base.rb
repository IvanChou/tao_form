module TaoForm
  module Components
    module MomentPicker
      class Base < TaoForm::Components::FieldComponent

        attr_reader :block_for_render, :result_options, :list_options

        def initialize view, builder = nil, attribute_name = nil, options = {}
          super view, builder, attribute_name, options
          init_result_options
          init_list_options
        end


        def input_type
          # to be implemented
        end

        def segments
          # to be implemented
        end

        def default_segment
          # to be implemented
        end

        def render &block
          @block_for_render = block
          render_template 'moment_picker', &block
        end

        def render_result
          view.tao_moment_picker_result(
            builder, attribute_name, result_options, &block_for_render
          )
        end

        def render_segment_list
          view.tao_moment_picker_segment_list list_options
        end

        def placeholder
          @placeholder ||= options.delete(:placeholder) || t(:placeholder)
        end

        private

        def init_result_options
          @result_options = {
            input_type: input_type,
            placeholder: placeholder,
            icon: options.delete(:icon),
            disabled: options[:disabled],
            value: options.delete(:value)
          }
        end

        def init_list_options
          @list_options = {
            segments: segments,
            default_segment: default_segment,
            disable_before: options.delete(:disable_before),
            disable_after: options.delete(:disable_after)
          }
        end

        def default_options
          {icon: :calendar, class: 'tao-moment-picker'}
        end

      end
    end
  end
end
