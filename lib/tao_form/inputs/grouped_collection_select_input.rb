module TaoForm
  module Inputs
    class GroupedCollectionSelectInput < ::SimpleForm::Inputs::GroupedCollectionSelectInput

      def input(wrapper_options = nil)
        label_method, value_method = detect_collection_methods
        merged_html_options = merge_wrapper_options(input_html_options, wrapper_options)
        merged_component_options = component_options.merge(merged_html_options)

        template.send :tao_select, merged_component_options do
          @builder.grouped_collection_select(
            attribute_name, grouped_collection, group_method, group_label_method,
            value_method, label_method, field_options, {
              multiple: merged_component_options[:multiple],
              disabled: merged_component_options[:disabled]
            }
          )
        end
      end

      private

      def component_options
        @component_options ||= input_options.slice(:multiple, :remote, :max_list_size,
          :searchable_size, :clearable, :placeholder, :disabled, :option_disabled,
          :include_blank, :prompt, :icon, :selected)
      end

      def field_options
        @field_options ||= begin
          opts = input_options.slice(:selected, :option_disabled, :include_blank, :prompt)
          opts[:disabled] = opts.delete(:option_disabled)
          opts
        end
      end

    end
  end
end
