# Rake task tomada de la página de Railroad (http://railroad.rubyforge.org/)
# Gracias a Thomas Ritz por el código (http://www.galaxy-ritz.de/)
# Modificada por Amaia Castro (amaia@dabne.net) para incluir la generación de 
# diagramas en png.

namespace :doc do
  namespace :diagram do
    task :models do
      sh "railroad -i -l -a -m -M | dot -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/models.svg"
    end
    task :models_png do
      sh "railroad -i -l -a -m -M | dot -Tpng | sed 's/font-size:14.00/font-size:11.00/g' > doc/models.png"
    end

    task :controllers do
      sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.svg"
    end
    task :controllers_png do
      sh "railroad -i -l -C | neato -Tpng | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.png"
    end
  end

  task :diagrams_svg => %w(diagram:models diagram:controllers)
  task :diagrams_png => %w(diagram:models_png diagram:controllers_png)
  task :diagrams => %w(diagram:models diagram:models_png diagram:controllers diagram:controllers_png)
end
