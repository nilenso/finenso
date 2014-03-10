require "prawn"

module Finenso
  class Letter
    ASSETS_DIR = File.expand_path("../../../assets", __FILE__)
    OUTPUT_DIR = File.expand_path("../../../target", __FILE__)

    def generate_pdf(body)
      Prawn::Document.generate("#{OUTPUT_DIR}/Forex cards issue request.pdf") do
        image "#{ASSETS_DIR}/nilenso-bg.png", width: 220, at: [410, cursor + 110]
        bounding_box([0, cursor - 20], width: 110) do
          font "Helvetica"
          font_size 9
          indent 0, 10 do
            text "Nilenso Software LLP", align: :right, style: :bold
            text "#147, 10th Cross", align: :right
            text "Indiranagar Stage 1", align: :right
            text "Bangalore, India, 560038", align: :right
          end
          stroke_color "F2136A"
          stroke_vertical_line bounds.bottom, bounds.top, at: bounds.right
        end
        move_down 200
        bounding_box([100, 500], width: 420) do
          today = Date.current
          text today.strftime("%B #{today.day.ordinalize} %Y"), align: :right
          text body
        end
      end
    end
  end
end
