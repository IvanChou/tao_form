module TaoForm
  module Components
    module Select
      class ResultComponent < TaoForm::Components::FieldComponent

        attr_reader :choices, :field_options, :placeholder

        def initialize view, builder, attribute_name, choices = nil, options = {}
          super view, builder, attribute_name, options
          @choices = choices
          @placeholder = options.delete(:placeholder)

          init_field_options
        end

        def render &block
          if block_given?
            super
          elsif builder && attribute_name
            super {
              builder.select attribute_name, choices, field_options, {disabled: options[:disabled]}
            }
          end
        end

        def self.component_name
          :select_result
        end

        private

        def init_field_options
          @field_options = {
            selected: options.delete(:selected),
            disabled: options.delete(:option_disabled),
            include_blank: options.delete(:include_blank),
            prompt: options.delete(:prompt)
          }
        end

        def default_options
          {class: 'tao-select-result select-result'}
        end

      end
    end
  end
end
