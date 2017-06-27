module TaoForm
  module Components
    class CheckBoxComponent < FieldComponent

      attr_reader :checked_value, :unchecked_value, :checked, :disabled, :field_options

      def initialize view, builder = nil, attribute_name = nil, options = {}
        super view, builder, attribute_name, options
        @checked_value = @options.delete(:checked_value)
        @unchecked_value = @options.delete(:unchecked_value)
        @checked = @options.delete(:checked)
        @disabled = @options.delete(:disabled)

        init_field_options
      end

      def self.component_name
        :check_box
      end

      def render &block
        if block_given?
          super
        elsif builder && attribute_name
          super {
            builder.check_box attribute_name, field_options, checked_value, unchecked_value
          }
        else
          super {
            view.check_box_tag nil
          }
        end
      end

      private

      def init_field_options
        @field_options = {
          disabled: disabled
        }

        unless checked.nil?
          @field_options[:checked] = checked
        end
      end

    end
  end
end
