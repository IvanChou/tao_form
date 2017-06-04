require 'tao_form/components/moment_picker/base'

module TaoForm
  module Components
    class DatePickerComponent < MomentPicker::Base

      def input_type
        @input_type ||= :date
      end

      def segments
        @segments ||= %w(year month date)
      end

      def default_segment
        @default_segment ||= :date
      end

      def self.component_name
        :date_picker
      end

    end
  end
end
