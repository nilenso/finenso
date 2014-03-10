require "prawn"

module Finenso
  class Letter
    def generate_pdf(body)
      document = Prawn::Document.new
      prepare_letterhead(document)
      document.move_down 200
      prepare_content(document, body)
      document.render_file("#{Finenso.config.target_dir}/Forex cards issue request.pdf")
    end

    def prepare_letterhead(document)
      document.image "#{Finenso.config.assets_dir}/nilenso-bg.png", width: 220, at: [410, document.cursor + 110]
      document.bounding_box([0, document.cursor - 20], width: 110) do
        document.font "Helvetica"
        document.font_size 9
        document.indent 0, 10 do
          document.text "Nilenso Software LLP", align: :right, style: :bold
          document.text "#147, 10th Cross", align: :right
          document.text "Indiranagar Stage 1", align: :right
          document.text "Bangalore, India, 560038", align: :right
        end
        document.stroke_color "F2136A"
        bounds = document.bounds
        document.stroke_vertical_line bounds.bottom, bounds.top, at: bounds.right
      end
    end

    def prepare_content(document, body = "")
      document.bounding_box([100, 500], width: 420) do
        today = Date.current
        document.text today.strftime("%B #{today.day.ordinalize} %Y"), align: :right
        document.text body
      end
    end
  end
end
