# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

module TwitterCldr
  module Formatters
    module RuleBasedNumberFormatter
      @formatters[:cs] = Czech = Class.new do
        class << self
          (def renderSpelloutNumberingYear(n)
            is_fractional = (n != n.floor)
            return n.to_s if is_fractional and (n > 1)
            return renderSpelloutNumbering(n) if (n >= 0)
          end
          def renderSpelloutNumbering(n)
            return renderSpelloutCardinalMasculine(n) if (n >= 0)
          end
          def renderSpelloutCardinalMasculine(n)
            is_fractional = (n != n.floor)
            return ("minus " + renderSpelloutCardinalMasculine(-n)) if (n < 0)
            if is_fractional and (n > 1) then
              return ((renderSpelloutCardinalMasculine(n.floor) + " čárka ") + renderSpelloutCardinalMasculine(n.to_s.gsub(/d*./, "").to_f))
            end
            return n.to_s if (n >= 1000000000000000000)
            if (n >= 5000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5.0e+15).floor) + " biliardů") + (if (n == 5000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000000000)))
              end))
            end
            if (n >= 2000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2.0e+15).floor) + " biliardy") + (if (n == 2000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000000000)))
              end))
            end
            if (n >= 1000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1.0e+15).floor) + " biliarda") + (if (n == 1000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 100000000000000)))
              end))
            end
            if (n >= 5000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000000.0).floor) + " biliónů") + (if (n == 5000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000000)))
              end))
            end
            if (n >= 2000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000000.0).floor) + " bilióny") + (if (n == 2000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000000)))
              end))
            end
            if (n >= 1000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000000.0).floor) + " bilión") + (if (n == 1000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 100000000000)))
              end))
            end
            if (n >= 5000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000.0).floor) + " miliardů") + (if (n == 5000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000)))
              end))
            end
            if (n >= 2000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000.0).floor) + " miliardy") + (if (n == 2000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000000)))
              end))
            end
            if (n >= 1000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000.0).floor) + " miliarda") + (if (n == 1000000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 100000000)))
              end))
            end
            if (n >= 5000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000.0).floor) + " miliónů") + (if (n == 5000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000)))
              end))
            end
            if (n >= 2000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000.0).floor) + " milióny") + (if (n == 2000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 1000000)))
              end))
            end
            if (n >= 1000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000.0).floor) + " milión") + (if (n == 1000000) then
                ""
              else
                (" " + renderSpelloutCardinalMasculine((n % 100000)))
              end))
            end
            if (n >= 5000) then
              return ((renderSpelloutCardinalFeminine((n / 5000.0).floor) + " tisíc") + ((n == 5000) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 1000))))))
            end
            if (n >= 2000) then
              return ((renderSpelloutCardinalFeminine((n / 2000.0).floor) + " tisíce") + ((n == 2000) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 1000))))))
            end
            if (n >= 1000) then
              return ((renderSpelloutCardinalFeminine((n / 1000.0).floor) + " tisíc") + ((n == 1000) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 100))))))
            end
            if (n >= 500) then
              return ((renderSpelloutCardinalFeminine((n / 500.0).floor) + " set") + ((n == 500) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 100))))))
            end
            if (n >= 300) then
              return ((renderSpelloutCardinalFeminine((n / 300.0).floor) + " sta") + ((n == 300) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 100))))))
            end
            if (n >= 200) then
              return ((renderSpelloutCardinalFeminine((n / 200.0).floor) + " stě") + ((n == 200) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 100))))))
            end
            if (n >= 100) then
              return ("sto" + ((n == 100) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 100))))))
            end
            if (n >= 90) then
              return ("devadesát" + ((n == 90) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            if (n >= 80) then
              return ("osmdesát" + ((n == 80) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            if (n >= 70) then
              return ("sedmdesát" + ((n == 70) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            if (n >= 60) then
              return ("šedesát" + ((n == 60) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            if (n >= 50) then
              return ("padesát" + ((n == 50) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            if (n >= 20) then
              return ((renderSpelloutCardinalMasculine((n / 20.0).floor) + "cet") + ((n == 20) ? ("") : ((" " + renderSpelloutCardinalMasculine((n % 10))))))
            end
            return "devatenáct" if (n >= 19)
            return "osmnáct" if (n >= 18)
            return "sedmnáct" if (n >= 17)
            return "šestnáct" if (n >= 16)
            return "patnáct" if (n >= 15)
            return "čtrnáct" if (n >= 14)
            return "třináct" if (n >= 13)
            return "dvanáct" if (n >= 12)
            return "jedenáct" if (n >= 11)
            return "deset" if (n >= 10)
            return "devět" if (n >= 9)
            return "osm" if (n >= 8)
            return "sedm" if (n >= 7)
            return "šest" if (n >= 6)
            return "pět" if (n >= 5)
            return "čtyři" if (n >= 4)
            return "tři" if (n >= 3)
            return "dva" if (n >= 2)
            return "jeden" if (n >= 1)
            return "nula" if (n >= 0)
          end
          def renderSpelloutCardinalNeuter(n)
            is_fractional = (n != n.floor)
            return ("minus " + renderSpelloutCardinalNeuter(-n)) if (n < 0)
            if is_fractional and (n > 1) then
              return ((renderSpelloutCardinalNeuter(n.floor) + " čárka ") + renderSpelloutCardinalNeuter(n.to_s.gsub(/d*./, "").to_f))
            end
            return n.to_s if (n >= 1000000000000000000)
            if (n >= 5000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5.0e+15).floor) + " biliardů") + (if (n == 5000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000000000)))
              end))
            end
            if (n >= 2000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2.0e+15).floor) + " biliardy") + (if (n == 2000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000000000)))
              end))
            end
            if (n >= 1000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1.0e+15).floor) + " biliarda") + (if (n == 1000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 100000000000000)))
              end))
            end
            if (n >= 5000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000000.0).floor) + " biliónů") + (if (n == 5000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000000)))
              end))
            end
            if (n >= 2000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000000.0).floor) + " bilióny") + (if (n == 2000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000000)))
              end))
            end
            if (n >= 1000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000000.0).floor) + " bilión") + (if (n == 1000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 100000000000)))
              end))
            end
            if (n >= 5000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000.0).floor) + " miliardů") + (if (n == 5000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000)))
              end))
            end
            if (n >= 2000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000.0).floor) + " miliardy") + (if (n == 2000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000000)))
              end))
            end
            if (n >= 1000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000.0).floor) + " miliarda") + (if (n == 1000000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 100000000)))
              end))
            end
            if (n >= 5000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000.0).floor) + " miliónů") + (if (n == 5000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000)))
              end))
            end
            if (n >= 2000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000.0).floor) + " milióny") + (if (n == 2000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 1000000)))
              end))
            end
            if (n >= 1000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000.0).floor) + " milión") + (if (n == 1000000) then
                ""
              else
                (" " + renderSpelloutCardinalNeuter((n % 100000)))
              end))
            end
            if (n >= 5000) then
              return ((renderSpelloutCardinalFeminine((n / 5000.0).floor) + " tisíc") + ((n == 5000) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 1000))))))
            end
            if (n >= 2000) then
              return ((renderSpelloutCardinalFeminine((n / 2000.0).floor) + " tisíce") + ((n == 2000) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 1000))))))
            end
            if (n >= 1000) then
              return ((renderSpelloutCardinalFeminine((n / 1000.0).floor) + " tisíc") + ((n == 1000) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 100))))))
            end
            if (n >= 500) then
              return ((renderSpelloutCardinalFeminine((n / 500.0).floor) + " set") + ((n == 500) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 100))))))
            end
            if (n >= 300) then
              return ((renderSpelloutCardinalFeminine((n / 300.0).floor) + " sta") + ((n == 300) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 100))))))
            end
            if (n >= 200) then
              return ((renderSpelloutCardinalFeminine((n / 200.0).floor) + " stě") + ((n == 200) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 100))))))
            end
            if (n >= 100) then
              return ("sto" + ((n == 100) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 100))))))
            end
            if (n >= 90) then
              return ("devadesát" + ((n == 90) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            if (n >= 80) then
              return ("osmdesát" + ((n == 80) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            if (n >= 70) then
              return ("sedmdesát" + ((n == 70) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            if (n >= 60) then
              return ("šedesát" + ((n == 60) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            if (n >= 50) then
              return ("padesát" + ((n == 50) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            if (n >= 20) then
              return ((renderSpelloutCardinalMasculine((n / 20.0).floor) + "cet") + ((n == 20) ? ("") : ((" " + renderSpelloutCardinalNeuter((n % 10))))))
            end
            return renderSpelloutCardinalMasculine(n) if (n >= 3)
            return "dvě" if (n >= 2)
            return "jedno" if (n >= 1)
            return "nula" if (n >= 0)
          end
          def renderSpelloutCardinalFeminine(n)
            is_fractional = (n != n.floor)
            return ("minus " + renderSpelloutCardinalFeminine(-n)) if (n < 0)
            if is_fractional and (n > 1) then
              return ((renderSpelloutCardinalFeminine(n.floor) + " čárka ") + renderSpelloutCardinalFeminine(n.to_s.gsub(/d*./, "").to_f))
            end
            return n.to_s if (n >= 1000000000000000000)
            if (n >= 5000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5.0e+15).floor) + " biliardů") + (if (n == 5000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000000000)))
              end))
            end
            if (n >= 2000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2.0e+15).floor) + " biliardy") + (if (n == 2000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000000000)))
              end))
            end
            if (n >= 1000000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1.0e+15).floor) + " biliarda") + (if (n == 1000000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 100000000000000)))
              end))
            end
            if (n >= 5000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000000.0).floor) + " biliónů") + (if (n == 5000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000000)))
              end))
            end
            if (n >= 2000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000000.0).floor) + " bilióny") + (if (n == 2000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000000)))
              end))
            end
            if (n >= 1000000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000000.0).floor) + " bilión") + (if (n == 1000000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 100000000000)))
              end))
            end
            if (n >= 5000000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000000.0).floor) + " miliardů") + (if (n == 5000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000)))
              end))
            end
            if (n >= 2000000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000000.0).floor) + " miliardy") + (if (n == 2000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000000)))
              end))
            end
            if (n >= 1000000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000000.0).floor) + " miliarda") + (if (n == 1000000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 100000000)))
              end))
            end
            if (n >= 5000000) then
              return ((renderSpelloutCardinalMasculine((n / 5000000.0).floor) + " miliónů") + (if (n == 5000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000)))
              end))
            end
            if (n >= 2000000) then
              return ((renderSpelloutCardinalMasculine((n / 2000000.0).floor) + " milióny") + (if (n == 2000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 1000000)))
              end))
            end
            if (n >= 1000000) then
              return ((renderSpelloutCardinalMasculine((n / 1000000.0).floor) + " milión") + (if (n == 1000000) then
                ""
              else
                (" " + renderSpelloutCardinalFeminine((n % 100000)))
              end))
            end
            if (n >= 5000) then
              return ((renderSpelloutCardinalFeminine((n / 5000.0).floor) + " tisíc") + ((n == 5000) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 1000))))))
            end
            if (n >= 2000) then
              return ((renderSpelloutCardinalFeminine((n / 2000.0).floor) + " tisíce") + ((n == 2000) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 1000))))))
            end
            if (n >= 1000) then
              return ((renderSpelloutCardinalFeminine((n / 1000.0).floor) + " tisíc") + ((n == 1000) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 100))))))
            end
            if (n >= 500) then
              return ((renderSpelloutCardinalFeminine((n / 500.0).floor) + " set") + ((n == 500) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 100))))))
            end
            if (n >= 300) then
              return ((renderSpelloutCardinalFeminine((n / 300.0).floor) + " sta") + ((n == 300) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 100))))))
            end
            if (n >= 200) then
              return ((renderSpelloutCardinalFeminine((n / 200.0).floor) + " stě") + ((n == 200) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 100))))))
            end
            if (n >= 100) then
              return ("sto" + ((n == 100) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 100))))))
            end
            if (n >= 90) then
              return ("devadesát" + ((n == 90) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            if (n >= 80) then
              return ("osmdesát" + ((n == 80) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            if (n >= 70) then
              return ("sedmdesát" + ((n == 70) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            if (n >= 60) then
              return ("šedesát" + ((n == 60) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            if (n >= 50) then
              return ("padesát" + ((n == 50) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            if (n >= 20) then
              return ((renderSpelloutCardinalMasculine((n / 20.0).floor) + "cet") + ((n == 20) ? ("") : ((" " + renderSpelloutCardinalFeminine((n % 10))))))
            end
            return renderSpelloutCardinalMasculine(n) if (n >= 3)
            return "dvě" if (n >= 2)
            return "jedna" if (n >= 1)
            return "nula" if (n >= 0)
          end)
        end
      end
    end
  end
end