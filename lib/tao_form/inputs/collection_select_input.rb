module TaoForm
  module Inputs
    class CollectionSelectInput < ::SimpleForm::Inputs::CollectionSelectInput

      def input(wrapper_options = nil)
        label_method, value_method = detect_collection_methods

        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

        multiple = input_options.delete(:multiple) || merged_input_options.delete(:multiple) || false
        tao_select_name = multiple ? :tao_multiple_select : :tao_select

        template.send tao_select_name, @builder, attribute_name, nil, input_options, merged_input_options do
          @builder.collection_select(
            attribute_name, collection, value_method, label_method, input_options, {multiple: multiple}
          )
        end
      end

    end
  end
end
