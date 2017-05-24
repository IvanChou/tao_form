module TaoForm
  module Components
    module MultipleSelect
      class ResultComponent < TaoForm::Components::Select::ResultComponent

        def render &block
          if block_given?
            super
          else
            super {
              builder.select attribute_name, choices, options, {multiple: true}
            }
          end
        end

        def self.component_name
          :multiple_select_result
        end

      end
    end
  end
end