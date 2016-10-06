require 'benchmark/ips'

module TopLevelModule
  def self.test
    5
  end
end

module A
  module B
    module C
      module D
        module E
          module F
            module G
              module H
                def self.with_colons
                  ::TopLevelModule.test
                end
                def self.without_colons
                  TopLevelModule.test
                end
              end
            end
          end
        end
      end
    end
  end
end

Benchmark.ips do |x|
  x.report("without colons") do
    A::B::C::D::E::F::G::H.without_colons
  end
  x.report("with colons") do
    ::A::B::C::D::E::F::G::H.with_colons
  end
end
