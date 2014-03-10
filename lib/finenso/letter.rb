require "prawn"

module Finenso
  class Letter
    def generate_pdf(body)
      document = Prawn::Document.new
      document.font_families.update("PT Sans" => {
        normal: "#{Finenso.config.assets_dir}/fonts/PT_Sans-Web-Regular.ttf",
        bold: "#{Finenso.config.assets_dir}/fonts/PT_Sans-Web-Bold.ttf"
      })
      document.move_up 20
      prepare_letterhead(document)
      document.move_down 200
      prepare_content(document, body)
      document.render_file("#{Finenso.config.target_dir}/Forex cards issue request.pdf")
    end

    def prepare_letterhead(document)
      document.image "#{Finenso.config.assets_dir}/images/nilenso-bg.png", width: 220, at: [410, document.cursor + 100]
      document.image "#{Finenso.config.assets_dir}/images/nilenso-logo-name-horiz.png", width: 140
      document.move_down 10
      document.bounding_box([0, document.cursor], width: 155) do
        document.font_size 10
        document.indent 0, 20 do
          document.font("PT Sans") do
            document.text "Nilenso Software LLP", align: :right, style: :bold
            document.text "#147, 10th Cross", align: :right
            document.text "Indiranagar Stage 1", align: :right
            document.text "Bangalore, India, 560038", align: :right
            document.move_down 8
            document.text "+91 80 4204 2671", align: :right
            document.text "moshimoshi@nilenso.com", align: :right
          end
        end
        document.stroke_color "F2136A"
        bounds = document.bounds
        document.stroke_vertical_line bounds.bottom, bounds.top, at: bounds.right
      end
    end

    def prepare_content(document, body = "")
      document.bounding_box([20, 500], width: 500) do
        today = Date.current
        document.text today.strftime("%B #{today.day.ordinalize} %Y"), align: :right
        document.text body
      end
    end
  end
end
